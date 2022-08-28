//
//  ShopingListTableViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/19.
//

import UIKit
import RealmSwift
import Zip

class ShoppingListTableViewController: UITableViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var uppperView: UIView!
    
    let localRealm = try! Realm()  //삭제 추가할것

    var shoppings: Results<ShoppingList>! {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchRealm()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "백업", style: .plain, target: self, action: #selector(backupButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "복구", style: .plain, target: self, action: #selector(restoreButtonClcked))
      
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
    
    func showActivityViewController(){
        //1-1. 도큐먼트 폴더까지 경로
        guard let path = documentDirectoryPath() else {
            showAlert(alterTitle: "도큐먼트 위치에 오류가 있습니다.", alertMessage: "")
            return
        }
        //1-2. 도큐먼트 폴더 경로에 + 렘파일 경로, 확장자까지!
        let backupFileURL = path.appendingPathComponent("SeSACDiary_1.zip")
        
        //1-3. 액티비티뷰컨 활성화해서 저장해주기
        let vc = UIActivityViewController(activityItems: [backupFileURL], applicationActivities: [])
        self.present(vc, animated: true)
    }
   
    
    @objc func backupButtonClicked() {
//        var urlPath: [URL]
        var urlPaths = [URL]()
        
        guard let path = documentDirectoryPath() else {
            showAlert(alterTitle: "도큐먼트 위치에 오류가 있습니다.", alertMessage:  "")
            return
        }
        let realmFile = path.appendingPathComponent("default.realm")
        guard FileManager.default.fileExists(atPath: realmFile.path) else {
            showAlert(alterTitle: "백업할 파일이 없습니다.", alertMessage: "")
            return
        }
        urlPaths.append(URL(string: realmFile.path)!)
        
        do {
            let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "ShoppingList1" )
            print("Archive Location: \(zipFilePath)")
            showActivityViewController()
        } catch {
            showAlert(alterTitle: "압축에 실패했습니다.", alertMessage: "")
        }
        
        
    }
    
    @objc func restoreButtonClcked() {
        //피커로 파일 지정
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.archive], asCopy: true)
        //delegate 채택
        documentPicker.delegate = self
        //다중선택 방지
        documentPicker.allowsMultipleSelection = false
        self.present(documentPicker, animated: true)
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

extension ShoppingListTableViewController: UIDocumentPickerDelegate {
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print(#function)
    }
    //복구 2.
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        //선택파일의 경로 확인
        guard let selectedFileURL = urls.first else { //MultipleSelect 막아뒀으므로 퍼스트
            showAlert(alterTitle: "선택하신 파일을 찾을 수 없습니다.", alertMessage: "")
            return
        }
        
        //도큐먼트 폴더까지 경로
        guard let path = documentDirectoryPath() else {
            showAlert(alterTitle: "도큐먼트 위치에 오류가 있습니다.", alertMessage: "")
            return
        }
        
        //압축파일의 경로 지정(lastPathComponent: 경로 마지막의 파일이름과 확장자까지 가져오기)
        let sandboxFileURL = path.appendingPathComponent(selectedFileURL.lastPathComponent)
        
        //파일이 이미 존재하는지 확인
        if FileManager.default.fileExists(atPath: sandboxFileURL.path){
            
            //압축해제
            let fileURL = path.appendingPathComponent("SeSACDiary_1.zip")
            
            do {
                //unzipFile(url:파일위치, destination: 풀어줄 위치, overwrite: 덮어씌울건지, pass:비번, progress: 진행도, fileoutputHandler: 압축해제 완료후 동작)
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("progress: \(progress)")
                }, fileOutputHandler: { unzippedFile in
                    print("unzippedFile: \(unzippedFile)")
                    self.showAlert(alterTitle: "복구가 완료되었습니다", alertMessage: "")
                })
            } catch {
                showAlert(alterTitle: "압축 해제에 실패했습니다.", alertMessage: "")
            }
            
        } else {
            
            do {
                //파일앱의 zip 도큐먼트로 복사
                try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
                
                //압축해제
                let fileURL = path.appendingPathComponent("SeSACDiary_1.zip")
                
                //unzipFile(url:파일위치, destination: 풀어줄 위치, overwrite: 덮어씌울건지, pass:비번, progress: 진행도, fileoutputHandler: 압축해제 완료후 동작)
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("progress: \(progress)")
                }, fileOutputHandler: { unzippedFile in
                    self.showAlert(alterTitle: "복구가 완료되었습니다", alertMessage: "")
                })
                
            } catch{
                showAlert(alterTitle: "압축 해제에 실패했습니다.", alertMessage: "")
            }
            
        }
        
    }
    
}
