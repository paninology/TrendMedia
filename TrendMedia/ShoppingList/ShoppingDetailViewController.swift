//
//  ShoppingDetailViewController.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/08/25.
//

import UIKit
import SnapKit
import RealmSwift


protocol ShoppingImageDelegate {
    
    func sendImageData(image: UIImage)
}

class ShoppingDetailViewController: UIViewController {
    
    let localRealm = try! Realm()
    var shopping: ShoppingList?

    let shoppingImageView: UIImageView  = {
       let view = UIImageView()
        view.backgroundColor = .gray
        return view
    }()
    
    let shoppongTitleLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .brown
        return view
    }()
    
    let imagePickerButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .blue
        view.setTitle("imagePicker", for: .normal)
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(cancelButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(saveButtonClicked))
        imagePickerButton.addTarget(self, action: #selector(imagePickerButtonClicked), for: .touchUpInside)

    }
    func saveImageToDocument(fileName: String, image: UIImage) {  // extension이나 서브클래스로 빼서 쓰면 좋다
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return } //Document 경로
        let fileURL = documentDirectory.appendingPathComponent(fileName) //세부 파일경로. 이미지 저장할 위치
        guard let data = image.jpegData(compressionQuality: 0.5) else { return } // 용량 줄이기
        
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("file save error", error)
        }
    }
    
    @objc func saveButtonClicked() {
        print("savesave")
        if let image = shoppingImageView.image {
            saveImageToDocument(fileName: "\(shopping!.objectId).jpg", image: image )
        }
        print("saveButtoncloooooooo")
        dismiss(animated: true)
        
    }
    @objc func cancelButtonClicked() {
        dismiss(animated: true)
        
    }
    
    @objc func imagePickerButtonClicked() {
        let vc = ImageSearchViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func configure() {
        [shoppingImageView, shoppongTitleLabel, imagePickerButton].forEach { self.view.addSubview($0) }
        
        shoppingImageView.snp.makeConstraints { make in
            make.leading.equalTo(24)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(-24)
            make.height.equalTo(shoppingImageView.snp.width).multipliedBy(0.6)
        }
        
        shoppongTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(shoppingImageView.snp.bottom).offset(8)
            make.leading.equalTo(24)
            make.trailing.equalTo(-24)
            make.height.equalTo(44)
        }
        
        imagePickerButton.snp.makeConstraints { make in
            make.top.equalTo(shoppongTitleLabel.snp.bottom).offset(8)
            make.leading.equalTo(24)
            make.trailing.equalTo(-24)
            make.height.equalTo(44)
        }
    }
    

}

extension ShoppingDetailViewController: ShoppingImageDelegate {
   
    func sendImageData(image: UIImage) {
        shoppingImageView.image = image
    }
    
    
}


