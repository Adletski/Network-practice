//
//  ViewController.swift
//  Networking
//
//  Created by Adlet Zhantassov on 24.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
//    private lazy var myCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        return collectionView
//    }()
//    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private lazy var photoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Press to download image", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(photoButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        return button
    }()
    
    private lazy var getImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private lazy var getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(getButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        return button
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private lazy var postButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("POST", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(postButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        return button
    }()
    
    private lazy var ourCoursesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private lazy var ourCoursesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Our courses", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(ourCoursesButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Controls"
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(photoImageView)
        view.addSubview(photoButton)
        view.addSubview(getImageView)
        view.addSubview(getButton)
        view.addSubview(postImageView)
        view.addSubview(postButton)
        view.addSubview(ourCoursesImageView)
        view.addSubview(ourCoursesButton)
    }
    
    private func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(150)
        }
        
        photoButton.snp.makeConstraints { make in
            make.centerX.equalTo(photoImageView.snp.centerX)
            make.centerY.equalTo(photoImageView.snp.centerY)
        }
        
        getImageView.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(150)
        }
        
        getButton.snp.makeConstraints { make in
            make.centerX.equalTo(getImageView.snp.centerX)
            make.centerY.equalTo(getImageView.snp.centerY)
        }
        
        postImageView.snp.makeConstraints { make in
            make.top.equalTo(getImageView.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(150)
        }
        
        postButton.snp.makeConstraints { make in
            make.centerX.equalTo(postImageView.snp.centerX)
            make.centerY.equalTo(postImageView.snp.centerY)
        }
        
        ourCoursesImageView.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(150)
        }
        
        ourCoursesButton.snp.makeConstraints { make in
            make.centerX.equalTo(ourCoursesImageView.snp.centerX)
            make.centerY.equalTo(ourCoursesImageView.snp.centerY)
        }
    }
    
    @objc func photoButtonPressed() {
        navigationController?.pushViewController(ImageViewController(), animated: true)
    }
    
    @objc func getButtonPressed() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            
            guard let response = response,
                  let data = data  else { return }
            print(response)
            print(data)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
            
        }.resume()
    }
    
    @objc func postButtonPressed() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let userData = ["Course": "Networking", "Lesson": "GET and POST request"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard let response = response,
                  let data = data else { return }
            
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    @objc func ourCoursesButtonPressed() {
        navigationController?.pushViewController(OurCoursesTableViewController(), animated: true)
    }
}
