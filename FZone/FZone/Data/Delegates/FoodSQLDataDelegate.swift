//
//  FoodSQLDataDelegate.swift
//  FZone
//
//  Created by Kaloyan on 4/2/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import Foundation

protocol FoodSQLDataDelegate {
    func didGetAll(foods: [FoodSQL])
    
    func didCreate(result: Any)
}


