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
        guard let url = URL(string: APIConstants.baseUrl.appending(APIConstants.nairobiNow)) else {
            throw NetworkError.invalidUrl
        }
        
        //get        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        //get the status report from server
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        //get the JSON data, decode and place the decoded info in the results
        let decoded = try JSONDecoder().decode(Wasanii.self, from: data)
        return decoded.items
    }
}
