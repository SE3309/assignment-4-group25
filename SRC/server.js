const express = require('express');
const mysql = require('mysql');
const path = require('path');
const cors = require('cors');

const app = express();
app.use(cors());

// Serve static files (HTML, CSS, JS)
app.use(express.static(path.join(__dirname, 'static')));

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


// Start server
const PORT = 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));





