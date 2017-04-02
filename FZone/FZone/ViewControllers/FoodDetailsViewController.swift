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
    @IBOutlet weak var labelCarbs: UILabel!
    @IBOutlet weak var labelFats: UILabel!
    @IBOutlet weak var labelProteins: UILabel!
    
    
    
    
    
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
        
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .save,
                            target: self,
                            action: #selector(FoodTableViewController.showAddModal))
        
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
            let currFood = self.food
            self.labelName.text = currFood?.name
            self.labelDescription.text = currFood?.foodDescription
            self.labelFats.text = currFood?.fat
            self.labelCarbs.text = currFood?.carbs
            self.labelProteins.text = currFood?.proteins
            self.hideLoadingScreen()
        }
    }
    

 

}
