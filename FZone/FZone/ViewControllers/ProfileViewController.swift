//
//  ProfileViewController.swift
//  FZone
//
//  Created by Kaloyan on 3/28/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var labelFirstName: UILabel!
    @IBOutlet weak var labelLastName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    
    
    let defaults = UserDefaults.standard;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfileData()
        //deleteUserDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadProfileData() {
        labelFirstName.text = defaults.string(forKey: defaultsKeys.firstName)
        labelLastName.text = defaults.string(forKey: defaultsKeys.lastName)
        labelWeight.text = defaults.string(forKey: defaultsKeys.weight)
        labelHeight.text = defaults.string(forKey: defaultsKeys.height)
        labelAge.text = defaults.string(forKey: defaultsKeys.age)
    }
    
    func deleteUserDefaults() {
        if let bundle = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundle)
        }
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
