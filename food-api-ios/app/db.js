const path = require("path");

const low = require("lowdb");

const db = low(path.join(__dirname, "../db.json"));
db._.mixin(require('lodash-id'))

db.defaults({ foods: [] })
    .write();

module.exports = db;