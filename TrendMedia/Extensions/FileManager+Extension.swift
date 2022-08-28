//
//  FileManager+Extension.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/08/28.
//

import UIKit

extension ViewController {
    
    func documentDirectoryPath() -> URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil } //Document 경로
        return documentDirectory
    }
}

extension UITableViewController {
    
    func documentDirectoryPath() -> URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil } //Document 경로
        return documentDirectory
    }
    
    
}
