//
//  LoadingExtensions.swift
//  FZone
//
//  Created by Kaloyan on 3/25/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import UIKit
import Foundation

let loadingScreen = UIActivityIndicatorView()

extension UIViewController {
    func showLoadingScreen() {
        loadingScreen.frame = self.view.frame
        loadingScreen.activityIndicatorViewStyle = .whiteLarge
        loadingScreen.backgroundColor = .gray
        self.view.addSubview(loadingScreen)
        loadingScreen.startAnimating()
    }
    
    func hideLoadingScreen() {
        loadingScreen.stopAnimating()
        loadingScreen.removeFromSuperview()
    }
}
