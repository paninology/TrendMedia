//
//  UIViewController+Extension.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/19.
//

import UIKit

extension UIViewController {
    
    func setBackgroundColor() {
        
        view.backgroundColor = .orange
        
    }
    
    func showAlert(alterTitle: String, alertMessage: String) {
        
        let alert = UIAlertController(title: alterTitle , message: alertMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default)
        alert.addAction(ok)
        
    }
}

