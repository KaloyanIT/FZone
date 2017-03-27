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
    var http: HttpRequester?

    override func viewDidLoad() {
        super.viewDidLoad();
        self.http = HttpRequester()
        // Do any additional setup after loading the view, typically from a nib.
        // Check git
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }   
}

