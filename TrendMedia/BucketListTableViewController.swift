//
//  BucketListTableViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/19.
//

import UIKit

class BucketListTableViewController: UITableViewController {

    @IBOutlet weak var userTextField: UITextField!
    
    var list = ["헤어질 결심", "범죄도시2", "토르"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list.append("마녀")
        list.append("aaaa")
        
    }
    
    @IBAction func userTextFieldReturned(_ sender: UITextField) {
        
        list.append(sender.text!)
        print(list)
        tableView.reloadData()  //중요!!!!
        tableView.reloadRows(at: [IndexPath(row: 0, section: 1),IndexPath(row: 0, section: 1)], with: .fade)
       
    }
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketListTableViewCell", for: indexPath) as! BucketListTableViewCell // 타입캐스팅
        
        cell.bucketListLabel.text = list[indexPath.row]
        cell.bucketListLabel.font = .boldSystemFont(ofSize: 18)
        
        return cell
        
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    
        true
    }

    //우측 스와이프 디폴트 기능
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            //배열 삭제 후 테이블뷰  갱신
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }

    }
    
    
   /*
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 즐겨찾기 핀고정 등등
    }
    */
}



