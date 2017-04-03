const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const morgan = require("morgan")

const db = require("./db");

const validator = require("./utils/validator");
const wait = require("./utils/waiter");

let app = express();

app.use(morgan("combined"))

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

app.set("view engine", "pug");

const seconds = 1;

app.get("/", (req, res) => {
    res.render("create");
})

app.get("/api/foods", (req, res) => {
    let foods = db.get("foods")
        .value()
        .map(food => {
            return {
                id: food.id,
                name: food.name,
                description: food.description,
                calories: food.calories,
                fat: food.fat,
                carbs: food.carbs,
                proteins: food.proteins                
            }
        });

    wait(seconds)
        .subscribe(() => {
            res.send(foods);
        });
});

app.get("/api/foods/:id", (req, res) => {
    const id = req.params.id;

    let food = db.get("foods")
        .find({ id })
        .value();

    wait(seconds)
        .subscribe(() => {
            res.send(food);
        });
});

app.post("/api/foods", (req, res) => {
    let food = req.body;
    console.log(food);
    const validationResult = validator.isValid(food);

    if (false) {
        wait(seconds)
            .subscribe(() => {
                res.status(400)
                    .send(validationResult);
            });
        return;
    }

    let id = db.get("foods")
        .insert(food)
        .write().id
    food.id = id;
    wait(seconds)
        .subscribe(() => {
            res.status(201)
                .send(food);
        });
});

app.delete("/api/foods/:id", (req, res) => {
    db.get("foods")
        .remove({ id: req.params.id })
        .write()
    wait(seconds)
        .subscribe(() => {
            res.send(true);
        })
})

const port = 3001;

app.listen(port, () => console.log(`Magic happens on :${port}`)); // eslint-disable-line no-console