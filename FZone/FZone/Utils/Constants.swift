//
//  Constants.swift
//  FZone
//
//  Created by Kaloyan on 4/2/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import Foundation

struct Constants {
    static let dbPath : String = {
        let documentsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                               .userDomainMask, true)[0]
        print(documentsDir)
        return "\(documentsDir)/foods.db"
    }()
    
}
