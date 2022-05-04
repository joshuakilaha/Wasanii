//
//  Item.swift
//  Wasanii
//
//  Created by mroot on 02/05/2022.
//

import Foundation

// MARK: - Wasanii
struct Wasanii: Codable {
    var status: String
    var feed: Feed
    var items: [Item]
}

// MARK: - Feed
struct Feed: Codable {
    var url: String
    var title: String
    var link: String
    var author, feedDescription: String
    var image: String

    enum CodingKeys: String, CodingKey {
        case url, title, link, author
        case feedDescription = "description"
        case image
    }
}

// MARK: - Item
struct Item: Codable {
    var title, pubDate: String
    var link: String
    var guid: String
    var author: Author
    var thumbnail: String
    var itemDescription, content: String
    var enclosure: Enclosure
    var categories: [String]

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
    var link: String
}


/**
 "items": [
     {
          "title": "Book Launch: Jackie Karuti’s Debut Monograph, “Notes Movement Method”, Apr. 27 2022 @ Circle Art Gallery",
 
          "pubDate": "2022-04-27 07:19:var
 
          "link": "https://nairobinow.wordpress.com/2022/04/27/book-launch-jackie-karutis-debut-monograph-notes-movement-method-apr-27-2022-circle-art-gallery/",
 
          "guid": "http://nairobinow.wordpress.com/?p=40829",
 
          "author": "Njathika",
 
          "thumbnail": "",
 
          "description": "The Nairobi Launch of Jackie Karuti’s debut monograph, Notes Movement Method. Exhibition preview &amp; book launch Date: Wednesday, 27 April 2022 Venue: Circle Art Gallery Time: 4 – 8 pm About Jackie Karuti was the main prize winner of the 2020 Henrike Grohs Art Award. This book is published as part of the award, with support from the Goethe-Institut and […]",
 
          "content": "\n<p>The Nairobi Launch of Jackie Karuti’s debut monograph, Notes Movement Method.</p>\n\n\n\n<p><strong>Exhibition preview &amp; book launch</strong><strong></strong></p>\n\n\n\n<p>Date: Wednesday, 27 April 2022</p>\n\n\n\n<p>Venue: Circle Art Gallery</p>\n\n\n\n<p>Time: 4 – 8 pm</p>\n\n\n\n<blockquote class=\"wp-block-quote\">\n<p><strong>About</strong></p>\n<p>Jackie Karuti was the main prize winner of the 2020 Henrike Grohs Art Award. This book is published as part of the award, with support from the Goethe-Institut and Grohs family. Additional support was provided by The African Arts Trust. This book was produced by the Visual Arts Network of South Africa. </p>\n<p>The book is led by thoughts around Karuti’s ongoing method of inquiry; How Clouds are Formed which has been a developing body of work assembled in many parts using objects, images, spare parts &amp; movements. The intention was to produce an artist workbook that sends one out into the field to move, question &amp; discover. It is largely an attempt to recognize the work that emerges in the present while navigating various site visits through drawings, text, sculptural forms and moving images.</p>\n<p><br>Text and image contributions by Wanja Kimani, Bojana Cvejić, Jackie Karuti &amp; Roseline Olang’.</p>\n<p>Additional images by James Muriuki &amp; Densu Moseti </p>\n</blockquote>\n\n\n\n<p><em>The book is will be available for purchase during the launch for KES 2,500.</em></p>\n",
 
          "enclosure": {
              "link": "https://1.gravatar.com/avatar/d2cef3901e6eadd2e59a29e18644ef5a?s=96&amp;d=identicon&amp;r=G"
          },
 
          "categories": [
              "art exhibits",
              "books",
              "events",
              "Bojana Cvejić",
              "Circle Art Gallery",
              "Densu Moseti",
              "Jackie Karuti",
              "James Muriuki",
              "Notes Movement Method",
              "Roseline Olang&amp;#039;",
              "Wanja Kimani"
          ]
      },
 ]
 */
