//
//  ContentView.swift
//  Wasanii
//
//  Created by mroot on 02/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var itemViewModel = ItemViewModel(service: ItemService())
    
    
    var body: some View {
        
        TabView {
            //MARK: -Home Page
            NavigationView {
                
                switch itemViewModel.state {
                    
                case .success(let data) :
                    
                    VStack {
                        List {
                            ForEach(data, id:\.itemDescription) { item in
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
           .tabItem {
               Image(systemName: "house.fill")
               Text("Home")
           }
            
            //MARK: -Search
            
            Text("Search")
            
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            //MARK: -Alert
            Text("Alert")
            
                .tabItem {
                    Image(systemName: "bell")
                }
            
            //MARK: Profile
            
            Text("Profile")
            
                .tabItem {
                    Image(systemName: "person")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
