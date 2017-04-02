//
//  ProfileDetailsFormsViewController.swift
//  FZone
//
//  Created by Kaloyan on 4/2/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import UIKit
import Toaster

class ProfileDetailsFormsViewController: UIViewController {
    @IBOutlet weak var textFieldFirstName: UITextField!
    @IBOutlet weak var textFieldLastName: UITextField!
    //SB == SlideBar
    @IBOutlet weak var labelAgeSB: UILabel!
    @IBOutlet weak var labelWeightSB: UILabel!
    @IBOutlet weak var labelHeightSB: UILabel!    
    @IBOutlet weak var labelCaloriesSB: UILabel!
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setProfileDetails() {
        let firstName = textFieldFirstName.text
        let lastName = textFieldLastName.text
        let age = labelAgeSB.text
        let weight = labelWeightSB.text
        let height = labelHeightSB.text
        let calories = labelCaloriesSB.text
        
        
        defaults.set(firstName, forKey: defaultsKeys.firstName)
        defaults.set(lastName, forKey: defaultsKeys.lastName)
        defaults.set(age, forKey: defaultsKeys.age)
        defaults.set(weight, forKey: defaultsKeys.weight)
        defaults.set(height, forKey: defaultsKeys.height)
        defaults.set(calories, forKey: defaultsKeys.calories)
    }
    
    

    @IBAction func createProfile(_ sender: Any) {
        let firstNameCharCount = textFieldFirstName.text?.characters.count;
        let lastNameCharCount = textFieldLastName.text?.characters.count;
        if(textFieldFirstName.text == nil || firstNameCharCount! <= 3 || textFieldLastName == nil || lastNameCharCount! <= 3 ) {
            let toast = Toast(text: "Name must be 4 chars at least")
            toast.show()
        } else {
            setProfileDetails();
            loadProfilePage();
        }
        
    }
    
    func loadProfilePage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        controller.selectedIndex = 2
        
        self.present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func onAgeChange(_ sender: UISlider) {
        let currValue = Int(sender.value)
        
        labelAgeSB.text = "\(currValue)"
    }
        
    @IBAction func onWeightChange(_ sender: UISlider) {
        let currValue = Int(sender.value)
        
        labelWeightSB.text = "\(currValue)"
    }
    
    
    @IBAction func onHeightChange(_ sender: UISlider) {
        let currValue = Int(sender.value)
        
        labelHeightSB.text = "\(currValue)"
    }
    
    @IBAction func onCaloriesChange(_ sender: UISlider) {
        let currValue = Int(sender.value)
        
        labelCaloriesSB.text = "\(currValue)"
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
