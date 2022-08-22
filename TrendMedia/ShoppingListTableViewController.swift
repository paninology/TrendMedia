//
//  ShopingListTableViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/19.
//

import UIKit
import RealmSwift

class ShoppingListTableViewController: UITableViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var uppperView: UIView!
    
    let localRealm = try! Realm()
//    var shoppingList = ["그립톡 구매하기", "사이다 구매", "양말"]
    var shoppings: Results<ShoppingList>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uppperView.layer.cornerRadius = 8
        uppperView.clipsToBounds = true
        uppperView.backgroundColor = .systemGray6
        addButton.layer.cornerRadius = 8
        addButton.backgroundColor = .systemGray5
        shoppings = localRealm.objects(ShoppingList.self).sorted(byKeyPath: "regDate", ascending: true)
        
      
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        guard let text = userTextField.text else { return }
//        shoppingList.append(userTextField.text!)
        let task = ShoppingList(shoppingTitle: text, regDate: Date())
        try! localRealm.write{
            localRealm.add(task)
        }
        userTextField.text = nil
        tableView.reloadData()
    }
    
    @IBAction func userTextFieldEntered(_ sender: UITextField) {
//        shoppingList.append(userTextField.text!)
        guard let text = userTextField.text else { return }
        let task = ShoppingList(shoppingTitle: text, regDate: Date())
        try! localRealm.write{
            localRealm.add(task)
        }
        userTextField.text = nil
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
            return shoppings.count
   
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as! ShoppingListTableViewCell
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
            cell.backgroundColor = .systemGray6
        print(shoppings)
        cell.shoppingLabel.text = shoppings[indexPath.row].shoppingTitle
        cell.checkButton.imageView?.image = shoppings[indexPath.row].isDone ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
        cell.starButton.imageView?.image = shoppings[indexPath.row].favorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        
            
            
            return cell
        
    }
   


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {

        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            shoppingList.remove(at: indexPath.row)
            
        }
    }
 

    


}
