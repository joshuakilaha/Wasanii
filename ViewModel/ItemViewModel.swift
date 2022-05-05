//
//  ItemViewModel.swift
//  Wasanii
//
//  Created by mroot on 02/05/2022.
//

import Foundation

//To bind Array of character results to the view
@MainActor  //Publish any UI Updates to the MainThread
class ItemViewModel: ObservableObject {
    
    //Constant States for the Views
    enum State {
        case notAvailable
        case loading
        case success(data: [Item])
        case failed(error: Error)
    }
    
    /**
     @private: Views to only access the state and not change it
     @.notAvailable: set to default since nothing has happen
     */
    @Published private(set) var state: State = .notAvailable //private
    @Published var hasError: Bool = false
    @Published var items: [Item] = []
    
    
    private let service: ItemService
    
    init(service: ItemService) {
        self.service = service
    }
    
    func getItems(url: String) async {
        //start loading
        self.state = .loading
        self.hasError = false
        
        do {
            let items = try await service.getRequests(url: url) //wait for response from fetchItems to continue
            self.state = .success(data: items) //on success response get decoded info and place in items
        } catch {
            //if the service.fetchItems func throws and error or fails to execute
            self.state = .failed(error: error)
            hasError = true
            debugPrint(error)
        }
    }
    
    func getCategory(url: String) async {
        
        self.state = .loading
        self.hasError = false
        
        do {
            let itemCategory = try await service.getRequests(url: url)
            self.state = .success(data: itemCategory)
        } catch {
            self.state = .failed(error: error)
            hasError = true
            debugPrint(error)
        }
    }
}
