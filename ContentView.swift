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
        
        NavigationView {
            
            switch itemViewModel.state {
                
            case .success(let data) :
                
                VStack {
                    List {
                        ForEach(data, id:\.itemDescription) { item in
                           // CharacterViewCell(name: item.name, status: item.status, images: item.image)
                            Text(item.title)
                        }
                    }
                } .navigationTitle("Events")
                
            case .notAvailable:
                EmptyView()
                
            case .loading:
                ProgressView()
                
            case .failed(error: let error):
                Text(error.localizedDescription)
            }
            
        } .task {
           await itemViewModel.getItems()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
