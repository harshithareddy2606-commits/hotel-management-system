const express = require('express');
const mysql = require('mysql2');
const path = require('path');

const app = express();

app.use(express.static(path.join(__dirname, 'public')));

app.get('/health', (req, res) => {
  res.send('Hotel Management Application Running');
});

app.listen(8080, () => {
  console.log('Server running on port 8080');
});
