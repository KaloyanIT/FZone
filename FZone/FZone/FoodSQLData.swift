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
                table.column(FoodSQL.getIdExpression(), primaryKey: true)
                table.column(FoodSQL.getNameExpression(), unique: true)
                table.column(FoodSQL.getDescriptionExpression())
                table.column(FoodSQL.getFatExpression())
                table.column(FoodSQL.getCarbsExpression())
                table.column(FoodSQL.getProteinsExpression())
                table.column(FoodSQL.getCaloriesExpression())
                })!)
        } catch let error as NSError {
            let toast = Toast(text: "Error: \(error.userInfo)")
            toast.show()
        }
    }
    
    func getAll() {
        do{
            let dbFood = try db?.prepare(self.foodTable!)
            let foodModels = dbFood?.map() {FoodSQL(withRow: $0)}
            self.delegate?.didGetAll(foods: foodModels!)
        } catch let error as NSError {
            let toast = Toast(text: "Error: \(error.userInfo)")
            toast.show()
        }
    }
    
    func create(food:FoodSQL) throws {
        try self.createMany(foods: [food])
    }
    
    func createMany(foods: [FoodSQL]) throws {
                try foods.forEach() { food in
            let insert = self.foodTable?.insert(FoodSQL.getNameExpression() <- food.name!,
                        FoodSQL.getDescriptionExpression() <- food.foodDescription!,
                        FoodSQL.getFatExpression() <- food.fat!,
                        FoodSQL.getCarbsExpression() <- food.carbs!,
                        FoodSQL.getProteinsExpression() <- food.proteins!,
                        FoodSQL.getCaloriesExpression() <- food.calories!)
            let result = try db?.run(insert!)
            delegate?.didCreate(result: result)
            print("Create - result")
            print(result!)
        }
    }
}
