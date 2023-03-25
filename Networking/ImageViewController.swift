//
//  ViewController.swift
//  Networking
//
//  Created by Adlet Zhantassov on 24.03.2023.
//

import UIKit
import SnapKit

class ImageViewController: UIViewController {
    
    //MARK: Data
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    private lazy var text: UILabel = {
        let label = UILabel()
        label.text = "Tap to show image"
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var urlButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.style = .large
        activity.color = .black
        activity.hidesWhenStopped = true
//        activity.isHidden = false
        return activity
    }()
    
    //MARK: Functions
    private func setupViews() {
        view.addSubview(imageView)
//        view.addSubview(activity)
        view.addSubview(text)
        view.addSubview(urlButton)
        view.addSubview(activity)
    }

    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        text.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.height.equalTo(20)
            make.width.equalTo(150)
        }
        
        urlButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.height.equalTo(20)
            make.width.equalTo(150)
        }
        
        activity.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
    
    //MARK: Work Area
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        buttonPressed()
    }
    
    @objc func buttonPressed() {
        print("button pressed")
        
        text.isHidden = true
        urlButton.isEnabled = false
        activity.isHidden = false
        activity.startAnimating()
        
        NetworkManager.downloadImage(url: "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg") { image in
            self.activity.stopAnimating()
            self.imageView.image = image
        }
    }
}

