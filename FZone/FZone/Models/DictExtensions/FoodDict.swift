//
//  BookDict.swift
//  FZone
//
//  Created by Kaloyan on 3/27/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

extension Food {
    convenience init(withDict dict: Dictionary<String, Any>) {
        let id = dict["id"] as! String
        let name = dict["name"] as! String
        let foodDescription = dict["description"] as! String
        self.init(withId: id, name:name, andDescription: foodDescription)
    }
    
    static func fromDict(_ dict: Dictionary<String, Any>) -> Food {
        return Food(withDict: dict)
    }
    
    func toDict() -> Dictionary<String, Any> {
        return [
            "name": self.name!,
            "description": self.foodDescription!
        ]
    }
}
