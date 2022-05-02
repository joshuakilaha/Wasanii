//
//  Item.swift
//  Wasanii
//
//  Created by mroot on 02/05/2022.
//

import Foundation


// MARK: - Wasanii
struct Wasanii: Codable {
    let status: String
    let feed: Feed
    let items: [Item]
}

// MARK: - Feed
struct Feed: Codable {
    let url: String
    let title: String
    let link: String
    let author, feedDescription: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case url, title, link, author
        case feedDescription = "description"
        case image
    }
}

// MARK: - Item
struct Item: Codable {
    let title, pubDate: String
    let link: String
    let guid: String
    let author: Author
    let thumbnail: String
    let itemDescription, content: String
    let enclosure: Enclosure
    let categories: [String]

    enum CodingKeys: String, CodingKey {
        case title, pubDate, link, guid, author, thumbnail
        case itemDescription = "description"
        case content, enclosure, categories
    }
}

enum Author: String, Codable {
    case njathika = "Njathika"
}


// MARK: - Enclosure
struct Enclosure: Codable {
    let link: String
}
