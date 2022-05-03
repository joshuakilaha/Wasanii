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
                    List {
                        ForEach(data, id:\.guid) { item in
                            ItemCell(title: item.title, thumnail: item.thumbnail)
                                .padding()
                        }
                    }
                } .navigationTitle("Events")
                    .listStyle(GroupedListStyle())
                
            case .notAvailable:
                EmptyView()
                
            case .loading:
                ProgressView()
                
            case .failed(error: let error):
                Text(error.localizedDescription)
            }
            
        } .navigationViewStyle(.stack)
        .task {
           await itemViewModel.getItems()
        }
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
