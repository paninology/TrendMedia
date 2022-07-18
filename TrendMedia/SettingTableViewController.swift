//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/18.
//

import UIKit


class SettingTableViewController: UITableViewController {

    var birthdayFriend = ["뽀로로", "신델레라", "울라프", "스노기", "모구리", "고래밥"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
    }
    
    //섹션의 갯수(옵션)
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "생일 섹션"
        } else if section == 1{
            return "즐겨찾기"
        } else if section == 2 {
            return "친구 140명"
        } else {
            return "세션"
        }
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer"
    }

    //1.셀의 갯수
    // ex. 카톡 100명 > 셀 100개, 30000명 > 셀 30000개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return birthdayFriend.count
        } else if section == 1 {
            return 2
        } else {
            
            return 5
            
        }
    }
    
    //2. 셀의 디자인과 데이터(필수)
    //ex. 카톡 이점팔, 프로필 사진, 상태 메시지 등
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //cell * 100
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        if indexPath.section == 0 {
      
            cell.textLabel?.text = birthdayFriend[indexPath.row]
           
            cell.textLabel?.textColor = .systemMint
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        } else if indexPath.section == 1 {
            cell.textLabel?.text = " 1번 인덱스셀 텍스트 "
            cell.textLabel?.textColor = .systemPink
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        } else if indexPath.section == 2 {
            cell.textLabel?.text = " 2번 인덱스셀 텍스트 "
            cell.textLabel?.textColor = .systemRed
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        } else {
            
        }
        
      return cell
        
    }
    
    
    
   

}
