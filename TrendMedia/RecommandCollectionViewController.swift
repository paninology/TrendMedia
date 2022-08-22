//
//  RecommandCollectionViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/07/20.
//

import UIKit
import Toast
import Kingfisher

/*
 TableView > collectionview
 Row > Item
 heightForRowAt > FlowLayout (heightForItemAt이 없는 이유)
 
 */




class RecommandCollectionViewController: UICollectionViewController {

    //1. 값 전달 = 데이터를 받을공간(프로퍼티) 생성
    var movie: Movie?
    
    
    var imageURL = "https://movie-phinf.pstatic.net/20180509_40/1525832749412sRMS6_JPEG/movie_image.jpg?type=m427_320_2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //3. 값 전달 - 프롶퍼티 값을 뷰에 표현
        
        title = movie == nil ? "데이터 없음" : movie!.title
        
        //컬렉션뷰의 셀 크기, 셀 사이 간격 등 설정
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCollectionViewCell", for: indexPath) as? RecommandCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.posterImageView.backgroundColor = .orange
        
        let url = URL(string: imageURL)
        cell.posterImageView.kf.setImage(with: url)
    
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.makeToast("\(indexPath.item)을 선택했습니ㅏㄷ.")
        self.navigationController?.popViewController(animated: true)
    }
    
  
}
