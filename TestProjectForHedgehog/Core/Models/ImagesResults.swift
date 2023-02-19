//
//  ImagesResults.swift
//  TestProjectForHedgehog
//
//  Created by Никита Мошенцев on 16.02.2023.
//

import Foundation

struct ImagesResults {
    let images: [Images]
}

extension ImagesResults: Decodable {
    enum CodingKeys: String, CodingKey {
        case images = "images_results"
    }
}
