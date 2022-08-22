//
//  SearchTableViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/19.
//

import UIKit


class SearchTableViewController: UITableViewController {

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var viewForTextField: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    
    var movies = MovieInfo()
        
 
    //MARK: VC의 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForTextField.backgroundColor = .systemGray5
        viewForTextField.layer.cornerRadius = 5
        searchTextField.backgroundColor = .systemGray5
        searchTextField.borderStyle = .none
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "처음으로", style: .plain, target: self, action: #selector(resetButtonClicked))
        print(#function)
        
        print("MY WOLD")
 
    }
    //MARK: 일반펑션
    
    ///시작화면으로 돌아가는 메서드
    @objc func resetButtonClicked() {
        //ios13 SceneDelegate 쓸때 가능
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    //MARK: 액션
    
    
    @IBAction func textClearButtonClicked(_ sender: UIButton) {
        searchTextField.text = nil
    }
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        upperView.isHidden = true
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.movie.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell 
        let data = movies.movie[indexPath.row]
        cell.configureCell(data: data)
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return (UIScreen.main.bounds.height / 8)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didselectRowAt")
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RecommandCollectionViewController") as! RecommandCollectionViewController
        
        //2. 값 전달 - vc가 가지고 있는 프로퍼티에 데이터 추가 
        vc.movie = movies.movie[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    
    }

    

}
