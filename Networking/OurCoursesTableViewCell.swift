//
//  OurCoursesTableViewCell.swift
//  Networking
//
//  Created by Adlet Zhantassov on 25.03.2023.
//

import UIKit
import SnapKit

class OurCoursesTableViewCell: UITableViewCell {
    
    static let identifier = "ourCoursesTableViewCell"

    lazy var ourCoursesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    lazy var nameOfCourse: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.text = "Name of course"
        return label
    }()
    
    lazy var numberOfLessons: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.text = "Number of lessons"
        return label
    }()
    
    lazy var label: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.text = "Name of course"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(ourCoursesImageView)
        contentView.addSubview(nameOfCourse)
        contentView.addSubview(numberOfLessons)
        contentView.addSubview(label)
    }
    
    private func setupConstraints() {
        ourCoursesImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            make.bottom.equalTo(contentView.snp.bottom)
            make.width.equalTo(150)
        }
        
        nameOfCourse.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(ourCoursesImageView.snp.trailing).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
        }
        
        numberOfLessons.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-25)
            make.leading.equalTo(ourCoursesImageView.snp.trailing).offset(10)
        }
        
        label.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-7)
            make.leading.equalTo(ourCoursesImageView.snp.trailing).offset(10)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ourCoursesImageView.image = nil
        nameOfCourse.text = nil
        numberOfLessons.text = nil
        label.text = nil
    }
}
