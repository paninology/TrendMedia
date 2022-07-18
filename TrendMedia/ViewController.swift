//
//  ViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    //언제 아웃렛컬렉션을 사용하는 것이 좋을까?
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateLable2: UILabel!
   
    @IBOutlet var dateLabelCollection: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertController = UIAlertController(title: "d", message: "d", preferredStyle: .actionSheet)
        
       
    }
    
    func configureLabelDesign() {
        //1. outletcollection
        
        for i in dateLabelCollection {
            i.font = .boldSystemFont(ofSize: 20)
            i.textColor = .brown
        
        }
        dateLabelCollection[0].text = "1번"
        dateLabelCollection[0].text = "2번"
        
        
        //2.uiLabel
        let labelArray = [dateLabel, dateLable2]
        for i in labelArray {
            i?.font = .boldSystemFont(ofSize: 20)
            i?.textColor = .brown
        }
    }

    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        
        let format = DateFormatter()
        format.dateFormat = "yyyy/MM/dd"
        
        dateLabel.text = format.string(from: sender.date)
    }
    
}

