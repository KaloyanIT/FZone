//
//  File.swift
//  FZone
//
//  Created by Kaloyan on 3/27/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

class Food {
    var id: String?
    var name: String?
    var foodDescription: String?
    var calories: String?
    var fat: String?
    var carbs: String?
    var proteins: String?
    
    convenience init(withName name: String, andDescription foodDescription: String?, withCalories cals: String?, withFats fats: String?, withCarbs carbs: String?, withProteins proteins: String?) {
        self.init(withId: "", name: name, andDescription: foodDescription, withCalories: cals, withFats: fats, withCarbs: carbs, withProteins: proteins)
    }
    
    init(withId id: String, name: String, andDescription foodDescription: String?, withCalories cals: String?, withFats fats: String?, withCarbs carbs: String?, withProteins proteins: String?) {
        self.id = id;
        self.name = name;
        self.foodDescription = foodDescription
        self.calories = cals
        self.fat = fats
        self.carbs = carbs
        self.proteins = proteins
    }
}
