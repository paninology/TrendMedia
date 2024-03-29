//
//  TaskTableViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/18.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case total, personal, others
    
    var sectionTitle: String {
        switch self {
        case .total:
            return "전체설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
    var rowTitle: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
    
    
}


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
        [EntireSetting.notice.rawValue,
         EntireSetting.lab.rawValue,
         EntireSetting.versionInfo.rawValue],
        [PersonalSetting.personalSecurity.rawValue,
         PersonalSetting.alertConfig.rawValue,
         PersonalSetting.chattingConfig.rawValue,
         PersonalSetting.multiProfile.rawValue],
        [EtcSetting.csCenter.rawValue]
    ]
    
    let headerArray = ["전체 설정", "개인 설정", "기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return SettingOptions.allCases.count
//        return settingElementsArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptions.allCases[section].rowTitle.count
//        return settingElementsArray[section].count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)

//        cell.textLabel?.text = settingElementsArray[indexPath.section][indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        /*  아래로 바뀌는듯....
        var content = cell.defaultContentConfiguration()
        content.text = settingElementsArray[indexPath.section][indexPath.row]
        content.textProperties.font = UIFont.systemFont(ofSize: 15)
        cell.contentConfiguration = content
         */
        
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].rowTitle[indexPath.row]
        
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
       return SettingOptions.allCases[section].sectionTitle
//        return headerArray[section]
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
//        header.textLabel?.adjustsFontSizeToFitWidth = true
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

}
