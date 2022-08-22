//
//  BucketListTableViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/19.
//

import UIKit

struct Todo {
    var title: String
    var done: Bool
}

class BucketListTableViewController: UITableViewController {
    //클래스는 ReferenceType -> 인스턴스 자체를 변경하지 않는 이상 한번만 될것
    //아웃렛은 viewdidload 호출 되기 직전에 닐인지 알 수 있다.즉 아웃렛먼저
    @IBOutlet weak var userTextField: UITextField! {
        didSet {
            userTextField.textAlignment = .center
            userTextField.font = .boldSystemFont(ofSize: 22)
            userTextField.textColor = .systemRed
            print("textfield didset")
        }
    }
    
    static let identifier = "BucketListTableViewController"
    
    //list 프로퍼티가 추가, 삭제 등 변경되고 나서 테이블뷰를 항상 갱신!
    var list = [
        Todo(title: "범죄도시2", done: false),
        Todo(title: "탑건", done: false)
    ] {
        didSet {
            tableView.reloadData()
            print("list가 변경됨 \(list), \(oldValue)")
        }
    }
    var textfieldPlaceholder = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        list.append("마녀")
//        list.append("aaaa")
        navigationItem.title = "버킷리스트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked) )
        userTextField.placeholder = "\(textfieldPlaceholder)를 입력해 주세요"
    }
    
    @objc func closeButtonClicked() {
        self.dismiss(animated: true)
    }
    
    @IBAction func userTextFieldReturned(_ sender: UITextField) {
        //case 2. if let
//        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) {
//            list.append(Todo(title: value, done: false))
//            tableView.reloadData()  //중요!!!!
//            tableView.reloadRows(at: [IndexPath(row: 0, section: 1),IndexPath(row: 0, section: 1)], with: .fade)
//        } else {
//            //토스트 메시지 띄우기
//        }
//
//        //case 3. guard 구문
//        guard let value2 = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines),
//              !value2.isEmpty,
//                (2...6).contains(value2.count) else {
//            //alert or Toast 통해서 알려줘야함
//            return
//        }
        list.append(Todo(title: sender.text!, done: false))
//        tableView.reloadData()  //중요!!!!
//        tableView.reloadRows(at: [IndexPath(row: 0, section: 1),IndexPath(row: 0, section: 1)], with: .fade)
       
    }
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BucketListTableViewCell.identifier, for: indexPath) as? BucketListTableViewCell else {
            return UITableViewCell()
        } // 타입캐스팅
        
        cell.bucketListLabel.text = list[indexPath.row].title
        cell.bucketListLabel.font = .boldSystemFont(ofSize: 18)
        
        cell.checkBoxButton.tag = indexPath.row
        cell.checkBoxButton.addTarget(self, action: #selector(checkBoxButtonClicked), for: .touchUpInside)
    
        let value = list[indexPath.row].done ? "checkmark.square.fill" : "checkmark.square"
        cell.checkBoxButton.setImage(UIImage(systemName: value), for: .normal)
        
        return cell
        
        
    }
    
    @objc func checkBoxButtonClicked(sender: UIButton) {
        print("\(sender.tag)버튼 클릭트")
        
        //배열 인덱스를 찾아서 done을 바꿔야 한다. 그리고 테이블뷰 갱신
        list[sender.tag].done.toggle()
//        tableView.reloadData()  List에 didSet 있으니 생략가능
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
        
        //재사용 셀에서 오류나는 코드
//        sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    
        true
    }

    //우측 스와이프 디폴트 기능
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            //배열 삭제 후 테이블뷰  갱신
            list.remove(at: indexPath.row)
//            tableView.reloadData()
        }

    }
    
    
   /*
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 즐겨찾기 핀고정 등등
    }
    */
}



