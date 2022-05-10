//
//  ContentView.swift
//  Wasanii
//
//  Created by mroot on 02/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkViewModel()
    
    var body: some View {
            VStack {
                    TabView {
                        //MARK: -Home Page
                        CategorySliderView()
                           .tabItem {
                               Image(systemName: "house.fill")
                               Text("Home")
                           }
                        
                        //MARK: -Search
                        SearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        
//                        //MARK: -Alert
//                        AlertView()
//                            .tabItem {
//                                Image(systemName: "bell")
//                                Text("Alert")
//                            }
//
//                        //MARK: -Profile
//                        ProfileView()
//                            .tabItem {
//                                Image(systemName: "person")
//                                Text("Profile")
//                            }
                        } .accentColor(.newPrimaryColor)
                
                if networkManager.isNotConnected {
                    NetworkErrorView(netStatus: networkManager.conncetionDescription, image: networkManager.imageName)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
