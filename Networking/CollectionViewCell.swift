//
//  CollectionViewCell.swift
//  Networking
//
//  Created by Adlet Zhantassov on 25.03.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    lazy var label: UILabel = {
       let label = UILabel()
        label.text = "adlet"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .gray
        layer.cornerRadius = 10
        contentView.addSubview(label)
    }
    
    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
