//
//  SearchView.swift
//  Wasanii
//
//  Created by mroot on 03/05/2022.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var itemList = SearchViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List(itemList.item, id: \.title) { item in
                ItemCell(title: item.title, thumnail: item.thumbnail)
                    .padding()
            }
                .listStyle(.plain)
                    .searchable(text: $searchText)
                    .onChange(of: searchText) { newValue in
                    Task {
                        if !newValue.isEmpty && newValue.count > 3 {
                            await itemList.searchItem(title: newValue)
                                
                        } else {
                            itemList.item.removeAll()
                        }
                }
            }
                    .navigationTitle("Search Event")
        }
        .navigationViewStyle(.stack)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
