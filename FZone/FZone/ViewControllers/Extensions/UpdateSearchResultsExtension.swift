//
//  UpdateSearchResultsExtension.swift
//  FZone
//
//  Created by Kaloyan on 4/2/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import UIKit

extension FoodTableViewController: UISearchResultsUpdating {
    
    @available(iOS 8.0, *)
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
}
