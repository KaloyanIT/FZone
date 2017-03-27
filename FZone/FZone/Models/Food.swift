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
    
    convenience init(withName name: String, andDescription foodDescription: String?) {
        self.init(withId: "", name: name, andDescription: foodDescription)
    }
    
    init(withId id: String, name: String, andDescription foodDescription: String?) {
        self.id = id;
        self.name = name;
        self.foodDescription = foodDescription
    }
}
