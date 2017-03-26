//
//  ViewController.swift
//  FZone
//
//  Created by Kaloyan on 3/19/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import UIKit
import FacebookLogin


class StartViewController: UIViewController {
    @IBOutlet weak var startText: UILabel!
    @IBOutlet weak var startButton: UIButton!
    var http: HttpRequester?

    override func viewDidLoad() {
        super.viewDidLoad();
        startText.center.x = self.view.center.x;
        startButton.center = self.view.center;
        
        
        self.http = HttpRequester()        
        //setStartText(text: "Start")
        // Do any additional setup after loading the view, typically from a nib.
        // Check git
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setStartText( text: String){
        startText.text = text
    }
    
        
    @IBAction func changeText(_ sender: Any) {
        setStartText(text: "Clicked")
    }
}

