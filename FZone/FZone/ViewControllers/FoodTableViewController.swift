//
//  FoodTableViewController.swift
//  FZone
//
//  Created by Kaloyan on 3/27/17.
//  Copyright © 2017 Kaloyan. All rights reserved.
//

import UIKit
import Presentr

class FoodTableViewController: UITableViewController, HttpRequesterDelegate, AddFoodModalDelegate {
    var foods: [Food] = []
    
    let presenter: Presentr = {
        let presenter = Presentr(presentationType: .popup)
        presenter.transitionType = .coverHorizontalFromRight // Optional
        return presenter
    }()
    
    
    var http: HttpRequester? {
        get{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.http;
        }
    }
    
    var url: String {
        get{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return "\(appDelegate.baseUrl)/foods"
        }
    }
    
    func loadFoods() {
        self.http?.delegate = self
        self.showLoadingScreen()
        
        self.http?.get(fromUrl: self.url)
    }
    
    func deleteFood(index: Int) {
        self.http?.delegate = self
        let food = self.foods[index]
        let url = "\(self.url)/\(food.id!)"
        self.showLoadingScreen()
        self.http?.delete(atUrl: url)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "food-cell")
        
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .add,
                            target: self,
                            action: #selector(FoodTableViewController.showAddModal))
        
        self.loadFoods()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func showAddModal() {
        let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "modal-add-food") as! AddFoodModalViewController
        
        nextVC.delegate = self
        
        
        self.customPresentViewController(self.presenter, viewController: nextVC, animated: true, completion: nil)
    }
    
    func didCreateFood(food: Food?) {
        self.foods.append(food!)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func showDeteails(of food: Food) {
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "food-details") as! FoodDetailsViewController
        nextVC.foodId = food.id
        
        self.navigationController?.show(nextVC, sender:self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveData(data: Any) {
        let dataArray = data as! [Dictionary<String, Any>]
        print(dataArray)
        
        self.foods = dataArray.map(){Food(withDict: $0)}
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.hideLoadingScreen()
        }
    }
    
    func didDeleteData() {
        DispatchQueue.main.async {
        self.loadFoods()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.foods.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "food-cell", for: indexPath)

        cell.textLabel?.text = self.foods[indexPath.row].name

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.deleteFood(index: indexPath.row)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showDeteails(of: self.foods[indexPath.row])
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
  */
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
