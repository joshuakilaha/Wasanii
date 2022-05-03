//
//  SearchViewModel.swift
//  Wasanii
//
//  Created by mroot on 03/05/2022.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    
    @Published var item: [ItemViewModelSearch] = []
    
    func searchItem(title: String) async {
        do {
            let itemDecoded = try await ItemService().getItem(searchedItem: title)
            self.item = itemDecoded.map(ItemViewModelSearch.init)
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ItemViewModelSearch {
   let item : Item
    
    var title: String {
        item.title
    }
    
}
