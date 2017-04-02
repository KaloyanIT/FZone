//
//  AddFoodModalViewController.swift
//  FZone
//
//  Created by Kaloyan on 3/30/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import UIKit

protocol AddFoodModalDelegate {
    func didCreateFood(food: Food?)
}

class AddFoodModalViewController: UIViewController, HttpRequesterDelegate {
    var delegate: AddFoodModalDelegate?
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var textFieldProteins: UITextField!
    @IBOutlet weak var textFieldFat: UITextField!
    @IBOutlet weak var textFieldCarbs: UITextField!
    @IBOutlet weak var textFieldCals: UITextField!
    
    
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
        
         self.http?.delegate = self

        // Do any additional setup after loading the view.
    }

    @IBAction func saveButton(_ sender: Any) {
        let name = self.textName.text
        let description = self.textDescription.text
        let fat = textFieldFat.text
        let carbs = textFieldCarbs.text
        let proteins = textFieldProteins.text
        let cals = textFieldCals.text
        
        let food = Food(withName: name!, andDescription: description!, withCalories: cals, withFats: fat, withCarbs: carbs, withProteins: proteins)
        
        let foodDict = food.toDict();
        print(foodDict)
        
        self.http?.postJson(toUrl: self.url, withBody: foodDict)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveData(data: Any) {
        let dict = data as! Dictionary<String, Any>
        let food = Food(withDict: dict)
        self.delegate?.didCreateFood(food: food)
        self.hideLoadingScreen()
        self.dismiss(animated: true, completion: nil)
    }
    
    func didReceiveError(error: HttpError) {
        print("Http error")
        print(error)
    } 
    
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
