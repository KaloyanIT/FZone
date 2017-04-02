//
//  FoodDetailsViewController.swift
//  FZone
//
//  Created by Kaloyan on 3/28/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import UIKit

class FoodDetailsViewController: UIViewController, HttpRequesterDelegate {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    
    
    
    var foodId: String?
    var food: Food?
    
    var url: String {
        get {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return "\(appDelegate.baseUrl)/foods"
        }
    }
    
    var http: HttpRequester? {
        get {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.http
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadFoodDetails()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFoodDetails() {
        self.http?.delegate = self
        let url = "\(self.url)/\(self.foodId!)"
        self.showLoadingScreen()
        self.http?.get(fromUrl: url)
    }
    
    func didReceiveData(data: Any) {
        let dict = data as! Dictionary<String, Any>
        self.food = Food(withDict: dict)
        self.updateUI()
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.labelName.text = self.food?.name
            self.labelDescription.text = self.food?.foodDescription
            self.hideLoadingScreen()
        }
    }
    

 

}
