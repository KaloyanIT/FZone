//
//  FoodDetailsViewController.swift
//  FZone
//
//  Created by Kaloyan on 3/28/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import UIKit
import Toaster

class FoodDetailsViewController: UIViewController, HttpRequesterDelegate, FoodSQLDataDelegate {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelCarbs: UILabel!
    @IBOutlet weak var labelFats: UILabel!
    @IBOutlet weak var labelProteins: UILabel!
    
    
    var data: FoodSQLData?
    
    var sqlFood: FoodSQL?
    var foodId: String?
    var food: Food?
    
    var url: String {
        get {
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return "\(getAppDelegate().baseUrl)/foods"
        }
    }
    
    var http: HttpRequester? {
        get {
            return getAppDelegate().http
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadFoodDetails()
        data = FoodSQLData(withPath: Constants.dbPath)
        
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .save,
                            target: self,
                            action: #selector(FoodDetailsViewController.saveInDb))
        
        // Do any additional setup after loading the view.
    }
    
    func saveInDb() {
        
        
            let name = self.food?.name!
            let foodDescription = self.food?.foodDescription!
            let fat = self.food?.fat!
            let carbs = self.food?.carbs!
            let proteins = self.food?.proteins!
            let calories = self.food?.calories!
            
            sqlFood =  FoodSQL(withName: name!, andDescription: foodDescription!, withCalories: calories!, withFats: fat!, withCarbs: carbs!, withProteins: proteins!)
            
            do {
                try data?.create(food: sqlFood!)
            } catch let error as NSError {
                let toast = Toast(text: "Error; \(error.userInfo)")
                print(error.userInfo)
                toast.show()
            }
        
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
            let currFood = self.food
            self.labelName.text = currFood?.name
            self.labelDescription.text = currFood?.foodDescription
            self.labelFats.text = currFood?.fat
            self.labelCarbs.text = currFood?.carbs
            self.labelProteins.text = currFood?.proteins
            self.hideLoadingScreen()
        }
    }
    
    func didGetAll(foods: [FoodSQL]) {
        let toast = Toast(text: "Foods received")
        toast.show()
    }
    
    func didCreate(result: Any) {
        print("food received")
        print(food)
    }

 

}
