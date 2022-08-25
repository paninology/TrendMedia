//
//  ImageSearchViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/08/25.
//

import UIKit


class ImageSearchViewController: UIViewController  {
    
    
    var selectImage: UIImage?
    var delegate: ShoppingImageDelegate?
    
    let image1Button: UIButton = {
       let view = UIButton()
        view.backgroundColor = .green
        view.setImage(UIImage(systemName: "star"), for: .normal)
        return view
    }()
    
    let image2Button: UIButton = {
       let view = UIButton()
        view.backgroundColor = .green
        view.setImage(UIImage(systemName: "star.fill"), for: .normal)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        image1Button.addTarget(self, action: #selector(imageButtonClicked), for: .touchUpInside)
        image2Button.addTarget(self, action: #selector(imageButtonClicked), for: .touchUpInside)
        
    }
    
   @objc func imageButtonClicked(sender: UIButton) {
        delegate?.sendImageData(image: sender.imageView!.image!)
       dismiss(animated: true)
    }
    
    func configure() {
        [image1Button, image2Button].forEach {
            view.addSubview( $0 )
        }
        
        image1Button.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.leading.equalTo(16)
            make.width.height.equalTo(44)
        }
        
        image2Button.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.trailing.equalTo(-16)
            make.width.height.equalTo(44)
        }
        
    }
    
    
}
