//
//  FoodSQLData.swift
//  FZone
//
//  Created by Kaloyan on 4/2/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//
import Foundation
import SQLite
import Toaster


class FoodSQLData {
    var delegate : FoodSQLDataDelegate?
    
    var db: Connection?
    var foodTable: Table?
    
    init(withPath path: String) {
        do {
            self.db = try Connection(path)
            self.foodTable = Table("foods")
            self.initDb()
        }
        catch let error as NSError {
            let toast = Toast(text: "Error: \(error.userInfo)")
            toast.show()
        }
    }
    
    func initDb() {
        do {
            try self.db?.run((self.foodTable?.create { table in
                table.column(Food.getIdExpression(), primaryKey: true)
                table.column(Food.getNameExpression(), unique: true)
                table.column(Food.getDescriptionExpression())
                table.column(Food.getFatExpression())
                table.column(Food.getCarbsExpression())
                table.column(Food.getProteinsExpression())
                table.column(Food.getCaloriesExpression())
                })!)
        } catch let error as NSError {
            let toast = Toast(text: "Error: \(error.userInfo)")
            toast.show()
        }
    }
    
    func getAll() {
        do{
            let dbFood = try db?.prepare(self.foodTable!)
            let foodModels = dbFood?.map() {Food(withRow: $0)}
            self.delegate?.didGetAll(foods: foodModels!)
        } catch let error as NSError {
            let toast = Toast(text: "Error: \(error.userInfo)")
            toast.show()
        }
    }
    
    func create(food:Food) throws {
        try self.createMany(foods: [food])
    }
    
    func createMany(foods: [Food]) throws {
                try foods.forEach() { food in
            let insert = self.foodTable?.insert(Food.getNameExpression() <- food.name!,
                        Food.getDescriptionExpression() <- food.foodDescription!,
                        Food.getFatExpression() <- food.fat!,
                        Food.getCarbsExpression() <- food.carbs!,
                        Food.getProteinsExpression() <- food.proteins!,
                        Food.getCaloriesExpression() <- food.calories!)
            let result = try db?.run(insert!)
            delegate?.didCreate(result: result)
            print(result!)
        }
    }
}
