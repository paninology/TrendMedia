//
//  SearchTableViewCell.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/19.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieStoryLabel: UILabel!
    
    
    /// 셀에 데이터 넣어주는 기능
    /// - Parameter data: 영화 정보가 들어있음
    func configureCell(data: Movie) {
        movieTitleLabel.font = .boldSystemFont(ofSize: 15)
        movieTitleLabel.text = data.title
        movieDateLabel.text = "\(data.releaseDate) | \(data.runtime)분 | \(data.rate)점"
        movieStoryLabel.text = data.overview
    }
    
    

}
