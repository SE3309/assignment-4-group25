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
    fetch('/api/foods') 
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
            loadMealPlans(); // Reload meal plans to include the newly created one
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

// Calculate total macros for the meal plan
function calculateMacros() {
    fetch(`/api/mealplan-macros?mealPlanId=${mealPlanId}`)
        .then(response => response.json())
        .then(data => {
            const macrosSection = document.getElementById('macrosSection');
            macrosSection.style.display = 'block';
            document.getElementById('totalMacros').textContent = `
                Total Calories: ${data.totalMacros.calories || 0}, 
                Protein: ${data.totalMacros.protein || 0}g, 
                Carbs: ${data.totalMacros.carbs || 0}g, 
                Fats: ${data.totalMacros.fats || 0}g
            `;
        })
        .catch(error => console.error('Error fetching macros:', error));
}

// Load all meal plans
function loadMealPlans() {
    fetch('/api/mealplans?userId=1') // Replace with dynamic user data
        .then(response => response.json())
        .then(data => {
            const mealPlansList = document.getElementById('mealPlansList');
            mealPlansList.innerHTML = '';
            data.forEach(plan => {
                const planElement = document.createElement('li');
                planElement.textContent = `Meal Plan: ${plan.PlanName}`;
                
                // Fetch and display the foods and macros for each meal plan
                const planDetailsButton = document.createElement('button');
                planDetailsButton.textContent = 'View Foods & Macros';
                planDetailsButton.addEventListener('click', () => viewMealPlanDetails(plan.MealPlanID));
                planElement.appendChild(planDetailsButton);
                
                mealPlansList.appendChild(planElement);
            });
        })
        .catch(error => console.error('Error loading meal plans:', error));
}

// View foods and macros for a meal plan
// Function to view details of a meal plan (including foods and macros)
// Function to view details of a meal plan (including foods and macros)
function viewMealPlanDetails(mealPlanId) {
    fetch(`/api/mealplan-details?mealPlanId=${mealPlanId}`)
        .then(response => response.json())
        .then(data => {
            // Check if the response contains the expected data
            if (!data || !data.Foods || !Array.isArray(data.Foods)) {
                console.error('Foods data is missing or malformed');
                return;
            }

            // Check if the details section exists
            const detailsSection = document.getElementById('mealPlansListSection');
            if (!detailsSection) {
                console.error('Details section not found');
                return;
            }

            // Clear previous content
            detailsSection.innerHTML = '';

            // Create meal plan details content
            const planName = document.createElement('h3');
            planName.textContent = `${data.PlanName || 'N/A'}`;
            detailsSection.appendChild(planName);

            // Create foods list if there are foods
            const foodsList = document.createElement('ul');
            if (data.Foods.length === 0) {
                const noFoodsItem = document.createElement('li');
                noFoodsItem.textContent = 'No foods in this meal plan.';
                foodsList.appendChild(noFoodsItem);
            } else {
                data.Foods.forEach(food => {
                    const foodItem = document.createElement('li');
                    foodItem.textContent = `${food.Name} - Serving Size: ${food.ServingSize}g`;
                    foodsList.appendChild(foodItem);
                });
            }
            detailsSection.appendChild(foodsList);

            // Display macros if available
            const macros = document.createElement('p');
            const macrosData = data.Macros || {};
            macros.textContent = `Macros: Calories: ${macrosData.Calories || 'N/A'}, Protein: ${macrosData.Protein || 'N/A'}, Carbs: ${macrosData.Carbs || 'N/A'}, Fats: ${macrosData.Fats || 'N/A'}`;
            detailsSection.appendChild(macros);
        })
        .catch(error => {
            console.error('Error fetching meal plan details:', error);
        });
}

// Function to fetch meal plans for userId = 1
async function getMealPlans() {
    const response = await fetch('/api/mealplans?userId=1');
    const mealPlans = await response.json();
    return mealPlans;
}

// Get the form and response message element
const form = document.getElementById('delete-form');
const responseMessage = document.getElementById('response-message');

form.addEventListener('submit', async function (e) {
    e.preventDefault();
    const planName = document.getElementById('mealPlanName').value.trim();

    // Check if responseMessage exists before trying to set its textContent
    if (!responseMessage) {
        console.error('Response message element not found');
        return;
    }

    try {
        // Fetch meal plans for userId = 1
        const mealPlans = await getMealPlans();

        // Find the meal plan by name
        const mealPlan = mealPlans.find(plan => plan.PlanName === planName);

        if (!mealPlan) {
            responseMessage.textContent = 'Meal plan not found!';
            return;
        }

        // Send DELETE request to the API to delete the meal plan
        const response = await fetch(`/api/meal-plans/${mealPlan.MealPlanID}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            },
        });

        const data = await response.json();

        if (response.ok) {
            responseMessage.textContent = data.message;
        } else {
            responseMessage.textContent = data.error;
        }
    } catch (error) {
        responseMessage.textContent = 'Error fetching or deleting the meal plan';
    }
});

// Load meal plans on page load
window.onload = loadMealPlans;
