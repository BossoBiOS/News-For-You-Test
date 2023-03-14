//
//  Networking.swift
//  News For You Test
//
//  Created by Stefan kund on 11/03/2023.
//

import UIKit
struct FILS {
    let article: Articles
    let image: UIImage?
}

struct infoStruct: Codable {
    let articles: [Articles]
}

struct Articles: Codable {
    
    let author, title, url, urlToImage, publishedAt, content: String?
    
}

