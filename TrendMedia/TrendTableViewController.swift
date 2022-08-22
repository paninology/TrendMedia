//
//  TrendTableViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/21.
//

import UIKit

class TrendTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func movieButtonClicked(_ sender: UIButton) {
        
        //화면전화: 1.스토리보드 파일 찾기 2.스토리보드 내에 뷰컨트롤러 찾기 3. 화면전환하기
        //영화버튼 클릭 > BucketlistTabelViewController present
        //1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        //2
        let vc = sb.instantiateViewController(withIdentifier: "BucketListTableViewController") as! BucketListTableViewController
        vc.textfieldPlaceholder = sender.currentTitle ?? "영화"
        
        self.present(vc, animated: true)
    }
    
    @IBAction func dramaButtonClicked(_ sender: UIButton) {
        
        //1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        //2
        let vc = sb.instantiateViewController(withIdentifier: "BucketListTableViewController") as! BucketListTableViewController
        vc.textfieldPlaceholder = "드라마"
        //2-1
        vc.modalPresentationStyle = .fullScreen
      
        
        //3
        self.present(vc, animated: true)
    }
    
    @IBAction func bookButtonClicked(_ sender: UIButton) {
        
        //1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        //2
        let vc = sb.instantiateViewController(withIdentifier: "BucketListTableViewController") as! BucketListTableViewController
        vc.textfieldPlaceholder = "도서"
        //2-1
        let nav = UINavigationController(rootViewController: vc)
        
        //2-1-1
        nav.modalPresentationStyle = .fullScreen
        
        //3
        self.present(nav, animated: true)
        
    }
    
}
