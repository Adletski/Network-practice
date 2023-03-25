//
//  CollectionViewController.swift
//  Networking
//
//  Created by Adlet Zhantassov on 25.03.2023.
//

import UIKit

enum Actions: String, CaseIterable {
    case DownloadImage = "Download Image"
    case GET = "GET"
    case POST = "POST"
    case OurCourses = "Our Courses"
    case UploadImage = "Upload Image"
}

class CollectionViewController: UIViewController {
    
//    let actions = ["Download Image", "GET", "POST", "Our Courses", "Upload Image"]
    let actions = Actions.allCases
    

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.label.text = actions[indexPath.row].rawValue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 40, height: view.frame.height/6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let action = actions[indexPath.row]
        
        switch action {
        case .DownloadImage:
            navigationController?.pushViewController(ImageViewController(), animated: true)
        case .GET:
            NetworkManager.getButtonPressed(url: "https://jsonplaceholder.typicode.com/posts")
        case .POST:
            NetworkManager.postButtonPressed(url: "https://jsonplaceholder.typicode.com/posts")
        case .OurCourses:
            navigationController?.pushViewController(OurCoursesTableViewController(), animated: true)
        case .UploadImage:
            print("upload image")
        }
    }
}
