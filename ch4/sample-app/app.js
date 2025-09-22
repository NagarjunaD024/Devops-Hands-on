const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('Hello, World!');
});

module.exports = app;

app.get('/name/:name', (req, res) => {
  res.send(`Hello, ${req.params.name}!`);
});