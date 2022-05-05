//
//  ItemService.swift
//  Wasanii
//
//  Created by mroot on 02/05/2022.
//

import Foundation

struct ItemService {
    
    enum NetworkError: Error {
        case invalidUrl
        case invalidResponse
        case invalidData
    }
    
    //get api request
    func getRequests() async throws -> [Item] {
        
        //get url
//        guard let url = URL(string: APIConstants.baseUrl.appending(APIConstants.nairobiNow).appending(APIConstants.key)) else {
//            throw NetworkError.invalidUrl
//        }
        guard let url = URL(string: "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fnairobinow.wordpress.com%2Ffeed%2F&api_key=eb0w267akvfdrgpwrcppbiepe8exqejorib67ssr") else {
            throw NetworkError.invalidUrl
        }
        
        
    //https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fnairobinow.wordpress.com%2Ffeed%2F&api_key=aiks2b9ma5dhqg8dcnsfanl275djzn8xxgllgaer
        
        //get        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        //get the status report from server
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        //get the JSON data, decode and place the decoded info in the results
        let decoded = try JSONDecoder().decode(Wasanii.self, from: data)
        //print(decoded)
        return decoded.items
    }
    
    //MARK: -Search Item
    func getItem(searchedItem: String) async throws -> [Item] {
        
        
        /**
         static let baseUrl = "https://api.rss2json.com/v1/api.json?rss_url="
         static let nairobiNow = "https://nairobinow.wordpress.com/feed/"
         static let key = "eb0w267akvfdrgpwrcppbiepe8exqejorib67ssr"
         */
        
        //quaery components
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.rss2json.com"
        components.path = "/v1/api.json"
        components.queryItems = [
            URLQueryItem(name: "rss_url", value: "https://nairobinow.wordpress.com/search/\(searchedItem.trimmed())/feed/rss2/"),
      //  URLQueryItem(name: "s", value: searchedItem),
       // URLQueryItem(name: "searchbutton", value: "Go%21")
        ]
        
        
        guard let url = components.url else {
            throw NetworkError.invalidUrl
            //print(Error)
        }
        
        print(url)
        //get
        let (data, response) = try await URLSession.shared.data(from: url)
        
        //get the status report from server
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        //get the JSON data, decode and place the decoded info in the results
        let itemToSearch = try JSONDecoder().decode(Wasanii.self, from: data)
        return itemToSearch.items
        
    }
    
    
    
    func getCategortyRequests(url1: String) async throws -> [Item] {
        
        //get url
        guard let url = URL(string: url1) else {
            throw NetworkError.invalidUrl
        }

        
        
    //https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fnairobinow.wordpress.com%2Ffeed%2F&api_key=aiks2b9ma5dhqg8dcnsfanl275djzn8xxgllgaer
        
        //get
        let (data, response) = try await URLSession.shared.data(from: url)
        
        //get the status report from server
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        //get the JSON data, decode and place the decoded info in the results
        let decoded = try JSONDecoder().decode(Wasanii.self, from: data)
        print(decoded)
        return decoded.items
    }
    
    
}
