//
//  HttpRequesterDelegate.swift
//  FZone
//
//  Created by Kaloyan on 3/26/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//
import UIKit

protocol HttpRequesterDelegate {
    func didReceiveData(data: Any)
    func didReceiveError(error: HttpError)
    func didDeleteData()
}

extension HttpRequesterDelegate {
    func didReceiveData(data: Any) {
        
    }
    
    func didReceiveError(error: HttpError) {
        
    }
    
    func didDeleteData() {
        
    }
}
