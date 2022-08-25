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
    var shoppings: Results<ShoppingList>! {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchRealm()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    func configure() {
        uppperView.layer.cornerRadius = 8
        uppperView.clipsToBounds = true
        uppperView.backgroundColor = .systemGray6
        addButton.layer.cornerRadius = 8
        addButton.backgroundColor = .systemGray5
    }
    
    func fetchRealm() {
        shoppings = localRealm.objects(ShoppingList.self).sorted(byKeyPath: "regDate", ascending: true)
//        print(shoppings)
        
    }
    func loadImageFromDoument(fileName: String) -> UIImage? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil } //Document 경로
        let fileURL = documentDirectory.appendingPathComponent(fileName) //세부 파일경로. 이미지 저장할 위치
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return UIImage(contentsOfFile: fileURL.path)
            
        } else {
            return UIImage(systemName: "xmark")
        }
      
    }
    
    @objc func checkButtonClicked(sender: UIButton) {
        print(sender.tag)
        do { try self.localRealm.write{
            self.shoppings[sender.tag].isDone.toggle()
            fetchRealm()
//            tableView.reloadData()
            
            print("checkButton Succeed")
            }
            
        } catch {
            print("checkButtonError")
        }
    }
    
    @objc func starButtonClicked(sender: UIButton) {
        do {
            try self.localRealm.write{
//            self.shoppings[sender.tag].favorite =  !self.shoppings[sender.tag].favorite
            self.localRealm.create(ShoppingList.self, value: ["objectId": self.shoppings[sender.tag].objectId, "favorite": !self.shoppings[sender.tag].favorite ], update: .modified)
            fetchRealm()
            print("checkButton Succeed")
            }
            
        } catch {
            print("checkButtonError")
        }
    }
    
    
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        guard let text = userTextField.text else { return }
//        shoppingList.append(userTextField.text!)
        let task = ShoppingList(shoppingTitle: text, regDate: Date())
        try! localRealm.write{
            localRealm.add(task)
        }
        userTextField.text = nil
//        tableView.reloadData()
        fetchRealm()
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

        cell.shoppingLabel.text = shoppings[indexPath.row].shoppingTitle
        cell.checkButton.imageView?.image = shoppings[indexPath.row].isDone ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
        cell.starButton.imageView?.image = shoppings[indexPath.row].favorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        cell.shoppingImageView.image = loadImageFromDoument(fileName: "\(shoppings[indexPath.row].objectId).jpg")
        
        cell.checkButton.tag = indexPath.row
        cell.starButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
//        self.fetchRealm()
 
            return cell
        
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row,"didselect====")
        
        let vc = ShoppingDetailViewController()
        let navi = UINavigationController(rootViewController: vc)
        
        vc.shoppongTitleLabel.text = shoppings[indexPath.row].shoppingTitle
        vc.shopping = self.shoppings[indexPath.row]
//        navigationController?.pushViewController(vc, animated: true)
        
        print("didSelect", vc)
        navi.modalPresentationStyle = .fullScreen
        present(navi, animated: true)
        
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
