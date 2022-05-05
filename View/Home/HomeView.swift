//
//  HomeView.swift
//  Wasanii
//
//  Created by mroot on 03/05/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var itemViewModel = ItemViewModel(service: ItemService())
    
    
    var body: some View {
        
        NavigationView {
                switch itemViewModel.state {
                
            case .success(let data) :
                    VStack {
                        CategorySliderView().padding()
                    
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
                    }
                
                .navigationTitle("Home")
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
            
        } .navigationViewStyle(.stack)
        .task {
            await itemViewModel.getItems(url: APIConstants.baseUrl.appending(APIConstants.nairobiNow))
        }
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}