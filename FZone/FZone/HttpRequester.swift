//
//  HttpRequester.swift
//  FZone
//
//  Created by Kaloyan on 3/24/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import UIKit

class HttpRequester {

    func get(fromUrl urlString: String) {
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler:
            {bodyData, response, error
                in
                do {
                    let body = try JSONSerialization.jsonObject(with: bodyData!, options: .allowFragments)
                    print(body)
                }
                catch {
                    print("Error")
                }
            })
        
        dataTask.resume()
        
    }
}
