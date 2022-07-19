//
//  SearchTableViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/19.
//

import UIKit

struct Movie {
    let title: String
    let date: String
    let story: String
}

class SearchTableViewController: UITableViewController {

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var viewForTextField: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    
    var movies = [
        Movie(title: "바람과 함께 사라지다", date: "1960/01/01", story: "재미있는 내용"),
        Movie(title: "성난 황소", date: "1990/01/01", story: "복싱하는 내용"),
        Movie(title: "택시 드라이버", date: "1993/03/03", story: "싸우는 내용")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForTextField.backgroundColor = .systemGray5
        viewForTextField.layer.cornerRadius = 5
        searchTextField.backgroundColor = .systemGray5
        searchTextField.borderStyle = .none
        
       
    }
    
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
        return movies.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        
        cell.movieTitleLabel.text = movies[indexPath.row].title
        cell.movieDateLabel.text = movies[indexPath.row].date
        cell.movieStoryLabel.text = movies[indexPath.row].story
        

        return cell
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
