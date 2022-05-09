//
//  CharityView.swift
//  Wasanii
//
//  Created by mroot on 05/05/2022.
//

import SwiftUI

struct CharityView: View {
    @StateObject var itemViewModel = ItemViewModel(service: ItemService())
    var body: some View {
        VStack {
                switch itemViewModel.state {
                
            case .success(let data):
                    VStack {
                        List {
                            ForEach(data, id: \.guid) { item in
                                ZStack {
                                    NavigationLink(destination: ItemDescriptionView(item: item)) {
                                       EmptyView()
                                    }.listRowSeparator(.hidden).opacity(0)
                                    ItemCell(title: item.title, thumnail: item.thumbnail, date: item.pubDate)
                                        
                                }
                            }
                        }
                        .onAppear(perform: {
                            UITableView.appearance().contentInset.top = -35
                        })
                    }
                .listStyle(GroupedListStyle())
                
            case .notAvailable:
                    VStack {
                        EmptyView().background(Color.black)
                    }
                
            case .loading:
                ProgressView()
                
            case .failed(error: let error):
                Text(error.localizedDescription)
            }
            
        }
        .navigationViewStyle(.stack)
        .task {
            await itemViewModel.getItems(url: APIConstants.baseUrl.appending(APIConstants.charityCategory).appending(APIConstants.api_key))
        }
    }
}

struct CharityView_Previews: PreviewProvider {
    static var previews: some View {
        CharityView()
    }
}
