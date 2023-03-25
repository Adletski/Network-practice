//
//  CourseModel.swift
//  Networking
//
//  Created by Adlet Zhantassov on 25.03.2023.
//

import Foundation

struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?
}
