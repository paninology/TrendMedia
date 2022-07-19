//
//  ShopingListTableViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/19.
//

import UIKit

class ShoppingListTableViewController: UITableViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var uppperView: UIView!
    
    
    var shoppingList = ["그립톡 구매하기", "사이다 구매", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uppperView.layer.cornerRadius = 8
        uppperView.clipsToBounds = true
        uppperView.backgroundColor = .systemGray6
        addButton.layer.cornerRadius = 8
        addButton.backgroundColor = .systemGray5
      
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        shoppingList.append(userTextField.text!)
        userTextField.text = nil
        tableView.reloadData()
    }
    
    @IBAction func userTextFieldEntered(_ sender: UITextField) {
        shoppingList.append(userTextField.text!)
        userTextField.text = nil
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
            return shoppingList.count
   
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as! ShoppingListTableViewCell
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
            cell.backgroundColor = .systemGray6
    
            cell.shoppingLabel.text = shoppingList[indexPath.row]
            
            
            return cell
        
    }
   


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {

        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
        }
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
