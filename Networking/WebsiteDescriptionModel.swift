//
//  WebsiteDescriptionModel.swift
//  Networking
//
//  Created by Adlet Zhantassov on 25.03.2023.
//

import Foundation

struct WebsiteDescription: Decodable {
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]
}
