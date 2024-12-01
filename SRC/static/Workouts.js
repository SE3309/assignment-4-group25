document.getElementById('searchButton').addEventListener('click', () => {
    const exerciseCount = document.getElementById('exerciseCount').value;

    if (!exerciseCount || exerciseCount <= 0) {
        alert('Please enter a valid number of exercises.');
        return;
    }

    fetch(`/api/workout-plans?totalExercises=${exerciseCount}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Failed to fetch workout plans');
            }
            return response.json();
        })
        .then(data => {
            const workoutPlansList = document.getElementById('workoutPlansList');
            workoutPlansList.innerHTML = '';

            if (data.length === 0) {
                const noPlans = document.createElement('li');
                noPlans.textContent = 'No workout plans found for this number of exercises.';
                workoutPlansList.appendChild(noPlans);
                return;
            }

            data.forEach(plan => {
                const li = document.createElement('li');
                li.textContent = `${plan.PlanName} (${plan.TotalExercises} exercises)`;
                workoutPlansList.appendChild(li);
            });
        })
        .catch(error => {
            console.error('Error:', error);
        });
});