//
//  DailyFoodMappings.swift
//  FZone
//
//  Created by Kaloyan on 4/3/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import Foundation
import SQLite


//let idExpression = Expression<Int64>("id")
//let nameExpression = Expression<String>("name")
//let descriptionExpression = Expression<String>("description")
//let fatExpression = Expression<String>("fat")
//let carbsExpression = Expression<String>("carbs")
//let proteinsExpression = Expression<String>("proteins")
//let calsExpression = Expression<String>("calories")

extension DailyFood {
    public static func getIdExpression() -> Expression<Int64> {
        return idExpression
    }
    
    public static func getNameExpression() -> Expression<String> {
        return nameExpression
    }
    
    public static func getDescriptionExpression() -> Expression<String> {
        return descriptionExpression
    }
    
    public static func getFatExpression() -> Expression<String> {
        return fatExpression
    }
    
    public static func getCarbsExpression() -> Expression<String> {
        return carbsExpression
    }
    
    public static func getProteinsExpression() -> Expression<String> {
        return proteinsExpression
    }
    
    public static func getCaloriesExpression() -> Expression<String> {
        return calsExpression
    }
    
    convenience init(withRow row: Row) {
        let id: Int64 = row[idExpression]
        let name: String = row[nameExpression]
        let description: String = row[descriptionExpression]
        let fat: String = row[fatExpression]
        let carbs: String = row[carbsExpression]
        let proteins: String = row[proteinsExpression]
        let cals: String = row[calsExpression]
        self.init(withId: id, name: name, andDescription: description, withCalories: cals, withFats: fat, withCarbs: carbs, withProteins: proteins)
    }
}
