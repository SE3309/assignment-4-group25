const express = require('express'); // Import Express
const app = express(); // Create an Express application


app.use(express.static('static'));

app.get('/', (req, res) => {
  res.send('???');
});

const PORT = 3000; 
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});




const bodyParser = require('body-parser');

// Use body-parser middleware
app.use(bodyParser.json()); // Parse JSON bodies

// Define a POST route
app.post('/data', (req, res) => {
  console.log(req.body); // Log the JSON body sent in the request
  res.send('Data received!');
});





