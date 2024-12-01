document.getElementById('mealSearchForm').addEventListener('submit', async (e) => {
    e.preventDefault();

    const food = document.getElementById('foodInput').value;
    const resultsSection = document.getElementById('results');

    try {
        const response = await fetch(`/api/meal-plans?food=${encodeURIComponent(food)}`);
        if (!response.ok) {
            throw new Error('Failed to fetch meal plans');
        }

        const data = await response.json();

        // Clear previous results
        resultsSection.innerHTML = '';

        if (data.length === 0) {
            resultsSection.innerHTML = '<p>No meal plans found for the specified food item.</p>';
            return;
        }

        // Display results
        const ul = document.createElement('ul');
        data.forEach(plan => {
            console.log(`PlanName: ${plan.PlanName}, MealPlanID: ${plan.MealPlanID}`); // Debug

            const li = document.createElement('li');
            li.textContent = plan.PlanName;
            li.style.cursor = 'pointer';
            li.dataset.mealPlanId = plan.MealPlanID; // Set MealPlanID in dataset

            li.addEventListener('click', () => {
                const mealPlanID = li.dataset.mealPlanId; // Retrieve MealPlanID
                console.log('Clicked MealPlanID:', mealPlanID); // Debug on click
                fetchMeals(mealPlanID); // Fetch meals for the clicked MealPlanID
            });

            ul.appendChild(li);
        });

        resultsSection.appendChild(ul);
    } catch (error) {
        console.error(error);
        resultsSection.innerHTML = '<p>Failed to fetch meal plans. Please try again later.</p>';
    }
});

// Function to fetch and display meals for a specific meal plan
async function fetchMeals(mealPlanID) {
    console.log('Fetching meals for MealPlanID:', mealPlanID); // Debugging log
    const resultsSection = document.getElementById('results');
    try {
        const response = await fetch(`/api/meal-plan-meals?mealPlanID=${mealPlanID}`);
        if (!response.ok) {
            throw new Error('Failed to fetch meals for the selected meal plan');
        }

        const data = await response.json();
        console.log('Fetched meals:', data); // Debugging log

        // Clear previous meal details and append new ones
        const mealDetails = document.createElement('div');
        mealDetails.innerHTML = `<h3>Meals in this Plan</h3>`;

        if (data.length === 0) {
            mealDetails.innerHTML += '<p>No meals found in this plan.</p>';
        } else {
            const ul = document.createElement('ul');
            data.forEach(meal => {
                const li = document.createElement('li');
                li.innerHTML = `
                    <strong>${meal.Name}</strong> - 
                    ${meal.Calories} calories, 
                    ${meal.Protein}g protein, 
                    ${meal.Carbs}g carbs, 
                    ${meal.Fats}g fats (Serving: ${meal.ServingSize})
                `;
                ul.appendChild(li);
            });
            mealDetails.appendChild(ul);
        }

        // Clear the results section and show the meals
        resultsSection.innerHTML = '';
        resultsSection.appendChild(mealDetails);
    } catch (error) {
        console.error(error);
        resultsSection.innerHTML = '<p>Failed to fetch meals. Please try again later.</p>';
    }
}

let mealPlanId = null;

// Fetch food options
function loadFoodOptions() {
    fetch('/api/foods') // Assumes an API endpoint to fetch all food items
        .then(response => response.json())
        .then(data => {
            const foodList = document.getElementById('foodList');
            foodList.innerHTML = '';
            data.forEach(food => {
                const option = document.createElement('option');
                option.value = food.FoodID;
                option.textContent = `${food.Name} (Cals: ${food.Calories}, P: ${food.Protein}, C: ${food.Carbs}, F: ${food.Fats})`;
                foodList.appendChild(option);
            });
        });
}

// Create a meal plan
document.getElementById('createPlanButton').addEventListener('click', () => {
    const planName = document.getElementById('planName').value;
    console.log(planName)
    if (!planName) {
        alert('Please enter a name for the meal plan.');
        return;
    }

    fetch('http://localhost:5000/api/meal-plans', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ userId: 1, planName }) // Replace userId with dynamic user data
    })
        .then(response => response.json())
        .then(data => {
            mealPlanId = data.mealPlanId;
            alert('Meal plan created!');
            document.getElementById('addFoodSection').style.display = 'block';
            loadFoodOptions();
        })
        .catch(error => console.error('Error creating meal plan:', error));
});

// Add food to the meal plan
document.getElementById('addFoodButton').addEventListener('click', () => {
    const foodId = document.getElementById('foodList').value;
    const servingSize = document.getElementById('servingSize').value;

    if (!foodId || !servingSize) {
        alert('Please select a food and enter a serving size.');
        return;
    }

    fetch('/api/mealplan-meals', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ mealPlanId, foodId, servingSize })
    })
        .then(() => {
            alert('Food added to the meal plan!');
            calculateMacros();
        })
        .catch(error => console.error('Error adding food:', error));
});

// Calculate total macros
function calculateMacros() {
    fetch(`/api/mealplan-macros?mealPlanId=${mealPlanId}`)
        .then(response => response.json())
        .then(data => {
            const macrosSection = document.getElementById('macrosSection');
            macrosSection.style.display = 'block';
            document.getElementById('totalMacros').textContent = `
                        Total Calories: ${data.TotalCalories || 0}, 
                        Protein: ${data.TotalProtein || 0}g, 
                        Carbs: ${data.TotalCarbs || 0}g, 
                        Fats: ${data.TotalFats || 0}g
                    `;
        })
        .catch(error => console.error('Error fetching macros:', error));
}