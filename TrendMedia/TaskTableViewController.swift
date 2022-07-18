//
//  TaskTableViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/18.
//

import UIKit
enum EntireSetting : String {
    case notice = "공지사항"
    case lab = "실험실"
    case versionInfo = "버전 정보"
}

enum PersonalSetting : String {
    case personalSecurity = "개인/보안"
    case alertConfig = "알림"
    case chattingConfig = "채팅"
    case multiProfile = "멀티프로필"
}

enum EtcSetting : String {
    case csCenter = "고객센터/도움말"
}


class TaskTableViewController: UITableViewController {

    let settingElementsArray = [
        [EntireSetting.notice.rawValue, EntireSetting.lab.rawValue, EntireSetting.versionInfo.rawValue],
        [PersonalSetting.personalSecurity.rawValue, PersonalSetting.alertConfig.rawValue, PersonalSetting.chattingConfig.rawValue, PersonalSetting.multiProfile.rawValue],
        [EtcSetting.csCenter.rawValue]
    ]
    
    let headerArray = ["전체 설정", "개인 설정", "기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return settingElementsArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return settingElementsArray[section].count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        
        cell.textLabel?.text = settingElementsArray[indexPath.section][indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)

        return cell
    }
   
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return headerArray[section]
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
//        header.textLabel?.adjustsFontSizeToFitWidth = true
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
