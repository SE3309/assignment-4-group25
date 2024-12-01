document.addEventListener("DOMContentLoaded", () => {
    const apiEndpoint = "http://localhost:5000/api/locations";

    const loadLocations = async () => {
        try {
            const response = await fetch(apiEndpoint);
            if (!response.ok) {
                throw new Error("Failed to fetch data");
            }
            const data = await response.json();
            displayLocations(data);
        } catch (error) {
            console.error("Error fetching locations:", error);
            document.getElementById("gym-locations").innerHTML =
                "<p>Failed to load gym locations. Please try again later.</p>";
        }
    };

    const displayLocations = (data) => {
        const container = document.getElementById("gym-locations");
        container.innerHTML = "";

        const groupedByLocation = data.reduce((acc, item) => {
            const locationKey = `${item.LocationName}|${item.Address}|${item.City}|${item.State}|${item.ZipCode}`;
            acc[locationKey] = acc[locationKey] || [];
            acc[locationKey].push(item.Equipment);
            return acc;
        }, {});

        for (const [locationDetails, equipment] of Object.entries(groupedByLocation)) {
            const [locationName, address, city, state, zipCode] = locationDetails.split("|");

            const locationDiv = document.createElement("div");
            locationDiv.classList.add("location");

            const locationHeader = document.createElement("h2");
            locationHeader.textContent = locationName;

            const locationInfo = document.createElement("p");
            locationInfo.textContent = `${address}, ${city}, ${state} ${zipCode}`;

            const equipmentList = document.createElement("ul");
            equipment.forEach((item) => {
                const equipmentItem = document.createElement("li");
                equipmentItem.textContent = item;
                equipmentList.appendChild(equipmentItem);
            });

            locationDiv.appendChild(locationHeader);
            locationDiv.appendChild(locationInfo);
            locationDiv.appendChild(equipmentList);

            container.appendChild(locationDiv);
        }
    };

    loadLocations();
});
