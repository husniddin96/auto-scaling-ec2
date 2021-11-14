const express = require('express');

const PORT = 3000;
const app = express();

app.get('/', (req, res) => {
    res.send('<h1>Auto Scaling Demo App</h1> <h4>message: success</h4> <p>version: 1.0.0</p>');
});

app.listen(PORT, () => console.log(`Demo app is listening on port: ${PORT}`)); 