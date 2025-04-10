const Database = require('better-sqlite3');
const uuid = require("uuid");
const express = require("express");
const app = express();
const db = new Database(`${uuid.v4()}.db`);

app.use(express.json());
app.use(express.static('public'))

function init() {
    db.exec("")
}