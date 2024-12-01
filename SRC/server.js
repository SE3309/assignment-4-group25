const express = require('express');
const mysql = require('mysql');
const path = require('path');
const cors = require('cors');

const app = express();
app.use(cors());

// Serve static files (HTML, CSS, JS)
app.use(express.static(path.join(__dirname, 'static')));
app.use(express.urlencoded({ extended: true }));
app.use(express.json())

// Database connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Mysqlpassword1!',
  database: 'GymDatabase'
});

db.connect((err) => {
  if (err) throw err;
  console.log('Connected to database');
});

// API endpoint to fetch filtered products
app.get('/api/products', (req, res) => {
  const { name, minPrice, maxPrice, inStock } = req.query;

  let query = 'SELECT * FROM product WHERE 1=1';
  const params = [];

  if (name) {
    query += ' AND Name LIKE ?';
    params.push(`%${name}%`);
  }
  if (minPrice) {
    query += ' AND Price >= ?';
    params.push(minPrice);
  }
  if (maxPrice) {
    query += ' AND Price <= ?';
    params.push(maxPrice);
  }
  if (inStock) {
    query += ' AND Stock > 0';
  }

  db.query(query, params, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

app.get("/api/locations", (req, res) => {
  const query = `
      SELECT GL.LocationName, GL.Address, GL.City, GL.State, GL.ZipCode, E.Name AS Equipment
      FROM GymLocation GL
      JOIN Equipment E ON GL.GymLocationID = E.GymLocationID;
  `;

  db.query(query, (err, results) => {
      if (err) {
          console.error("Error executing query:", err);
          res.status(500).send("Server error");
          return;
      }
      res.json(results);
  });
});

app.get('/api/meal-plans', (req, res) => {
  const food = req.query.food;
  if (!food) {
      return res.status(400).send('Food item is required');
  }

  const query = `
      SELECT MP.MealPlanID, MP.PlanName
      FROM MealPlan MP
      WHERE EXISTS (
          SELECT 1
          FROM MealPlanMeals MPM
          JOIN Food F ON MPM.FoodID = F.FoodID
          WHERE MP.MealPlanID = MPM.MealPlanID AND F.Name = ?
      )
  `;

  db.query(query, [food], (err, results) => {
      if (err) {
          console.error('Error executing query:', err);
          return res.status(500).send('Server error');
      }

      res.json(results); // Returns both MealPlanID and PlanName
  });
});


// Fetch all meals in a specific meal plan
app.get('/api/meal-plan-meals', (req, res) => {
  const mealPlanID = req.query.mealPlanID;
  if (!mealPlanID) {
      return res.status(400).send('MealPlanID is required');
  }

  const query = `
      SELECT F.Name, F.Calories, F.Protein, F.Carbs, F.Fats, MPM.ServingSize
      FROM MealPlanMeals MPM
      JOIN Food F ON MPM.FoodID = F.FoodID
      WHERE MPM.MealPlanID = ?
  `;

  db.query(query, [mealPlanID], (err, results) => {
      if (err) {
          console.error('Error executing query:', err);
          return res.status(500).send('Server error');
      }

      res.json(results);
  });
});

app.get('/api/workout-plans', (req, res) => {
  const totalExercises = parseInt(req.query.totalExercises, 10);
  if (isNaN(totalExercises)) {
      return res.status(400).send('Invalid number of exercises');
  }

  const query = `
      SELECT WP.WorkoutPlanID, WP.PlanName, COUNT(WPE.ExerciseName) AS TotalExercises
      FROM WorkoutPlan WP
      JOIN WorkoutPlanExercises WPE ON WP.WorkoutPlanID = WPE.WorkoutPlanID
      GROUP BY WP.WorkoutPlanID, WP.PlanName
      HAVING COUNT(WPE.ExerciseName) = ?
  `;

  db.query(query, [totalExercises], (err, results) => {
      if (err) {
          console.error('Error executing query:', err);
          return res.status(500).send('Server error');
      }

      res.json(results);
  });
});

app.post('/api/meal-plans', (req, res) => {
  const { userId, planName } = req.body;
  console.log('Received request body:', req.body);

  if (!userId || !planName) {
      return res.status(400).send('User ID and Plan Name are required');
  }

  const query = `
      INSERT INTO MealPlan (UserID, PlanName, CreatedAt)
      VALUES (?, ?, NOW())
  `;

  db.query(query, [userId, planName], (err, result) => {
      if (err) {
          console.error('Error creating meal plan:', err);
          return res.status(500).send('Server error');
      }

      res.json({ mealPlanId: result.insertId });
  });
});

app.post('/api/mealplan-meals', (req, res) => {
  const { mealPlanId, foodId, servingSize } = req.body;

  if (!mealPlanId || !foodId || !servingSize) {
      return res.status(400).send('MealPlanID, FoodID, and ServingSize are required');
  }

  const query = `
      INSERT INTO MealPlanMeals (MealPlanID, FoodID, ServingSize)
      VALUES (?, ?, ?)
  `;

  db.query(query, [mealPlanId, foodId, servingSize], (err) => {
      if (err) {
          console.error('Error adding food to meal plan:', err);
          return res.status(500).send('Server error');
      }

      res.send('Food added to meal plan');
  });
});

// Get foods and calculate macros for a specific meal plan
app.get('/api/mealplan-macros', (req, res) => {
  const { mealPlanId } = req.query;

  const query = `
      SELECT f.Name, mm.ServingSize, f.Calories, f.Protein, f.Carbs, f.Fats
      FROM mealplanmeals mm
      JOIN food f ON mm.FoodID = f.FoodID
      WHERE mm.MealPlanID = ?
  `;

  db.query(query, [mealPlanId], (err, results) => {
      if (err) {
          console.error('Error fetching foods for the meal plan:', err);
          return res.status(500).json({ error: 'Server error' });
      }

      if (results.length === 0) {
          return res.status(404).json({ error: 'No foods found for this meal plan' });
      }

      let totalMacros = {
          calories: 0,
          protein: 0,
          carbs: 0,
          fats: 0
      };

      results.forEach(food => {
          totalMacros.calories += food.Calories * food.ServingSize;
          totalMacros.protein += food.Protein * food.ServingSize;
          totalMacros.carbs += food.Carbs * food.ServingSize;
          totalMacros.fats += food.Fats * food.ServingSize;
      });

      res.json({ foods: results, totalMacros });
  });
});


app.get('/api/foods', (req, res) => {
  db.query('SELECT * FROM food', (err, results) => {
    if (err) {
      console.error('Error fetching foods:', err);
      return res.status(500).json({ error: 'Server error' });
    }
    res.json(results);
  });
});

// Fetch all meal plans for a specific user
app.get('/api/mealplans', (req, res) => {
  const userId = req.query.userId;

  const query = 'SELECT * FROM mealplan WHERE UserID = ?';
  db.query(query, [userId], (err, results) => {
      if (err) {
          console.error('Error fetching meal plans:', err);
          return res.status(500).json({ error: 'Server error' });
      }
      res.json(results);
  });
});

app.get('/api/mealplan-details', (req, res) => {
  const mealPlanId = req.query.mealPlanId;
  
  // Example database query to fetch meal plan and foods
  db.query('SELECT f.FoodID, f.Name, f.Calories, f.Protein, f.Carbs, f.Fats, mm.ServingSize FROM mealplanmeals mm JOIN food f ON mm.FoodID = f.FoodID WHERE mm.MealPlanID = ?', [mealPlanId], (err, results) => {
      if (err) {
          console.error(err);
          return res.status(500).json({ error: 'Database query failed' });
      }
      
      // Prepare the response data
      const foods = results.map(row => ({
          FoodID: row.FoodID,
          Name: row.Name,
          ServingSize: row.ServingSize,
          Calories: row.Calories,
          Protein: row.Protein,
          Carbs: row.Carbs,
          Fats: row.Fats
      }));

      // Example macros calculation (this could be more complex)
      const macros = {
          Calories: foods.reduce((sum, food) => sum + food.Calories, 0),
          Protein: foods.reduce((sum, food) => sum + food.Protein, 0),
          Carbs: foods.reduce((sum, food) => sum + food.Carbs, 0),
          Fats: foods.reduce((sum, food) => sum + food.Fats, 0)
      };

      // Send the response
      res.json({ PlanName: 'Foods in plan:', Foods: foods, Macros: macros });
  });
});

app.delete('/api/meal-plans/:mealPlanId', (req, res) => {
  const { mealPlanId } = req.params;

  // Ensure the mealPlanId is a valid number
  if (isNaN(mealPlanId)) {
      return res.status(400).json({ error: 'Invalid MealPlanID' });
  }

  // SQL query to delete the meal plan
  const query = 'DELETE FROM mealplan WHERE MealPlanID = ?';

  db.query(query, [mealPlanId], (err, results) => {
      if (err) {
          console.error('Error deleting meal plan:', err);
          return res.status(500).json({ error: 'Server error' });
      }

      // Check if any rows were affected (i.e., if the meal plan existed)
      if (results.affectedRows === 0) {
          return res.status(404).json({ error: 'Meal plan not found' });
      }

      // Successfully deleted the meal plan
      res.status(200).json({ message: 'Meal plan deleted successfully' });
  });
});

// Start server
const PORT = 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));





