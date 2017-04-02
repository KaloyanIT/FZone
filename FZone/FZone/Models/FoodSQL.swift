//
//  FoodSQL.swift
//  FZone
//
//  Created by Kaloyan on 4/2/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import Foundation

class FoodSQL {
    var id: Int64?
    var name: String?
    var foodDescription: String?
    var calories: String?
    var fat: String?
    var carbs: String?
    var proteins: String?
    
    convenience init(withName name: String, andDescription foodDescription: String?, withCalories cals: String?, withFats fats: String?, withCarbs carbs: String?, withProteins proteins: String?) {
        let id = Int64(arc4random())
        self.init(withId: id, name: name, andDescription: foodDescription, withCalories: cals, withFats: fats, withCarbs: carbs, withProteins: proteins)
    }
    
    init(withId id: Int64, name: String, andDescription foodDescription: String?, withCalories cals: String?, withFats fats: String?, withCarbs carbs: String?, withProteins proteins: String?) {
        self.id = id;
        self.name = name;
        self.foodDescription = foodDescription
        self.calories = cals
        self.fat = fats
        self.carbs = carbs
        self.proteins = proteins
    }

}
