//
//  ItemDescriptionView.swift
//  Wasanii
//
//  Created by mroot on 04/05/2022.
//

import SwiftUI

struct ItemDescriptionView: View {
    
    @State var title = ""
    @State var date = "2020-10-21 18:42:56"
    @State var description = ""
    @State var thumbnail = ""
    
    var item: Item
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                VStack {
                    
                    AsyncImage(url: URL(string: thumbnail)) { phase in
                            if let image = phase.image {
                                // Displays the loaded image.
                                image.ignoresSafeArea(edges: .top).frame(height: 50)

                            } else {
                                // Acts as a placeholder.
                                Image("defaultImage")
                                    .ignoresSafeArea(edges: .top)
                                    .frame(height: 50)
                            }
                    
                    } .padding(.bottom, 200.0)
                }

                
                ScrollView {

                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.title)
                            .bold()
                            .padding(.trailing, 180)

                        Text(Date().formatStringDate(date: date))
                            .foregroundColor(.gray)
                            .italic()
                    
                    } .padding()

                    Divider()
                        .frame(width: 400, height: 1)
                        .background(Color.newPrimaryColor)

                    VStack(alignment: .leading) {
                        Text("Event Details")
                            .font(.title2)

                        Text(description)
                    } .padding()
                }
                
                Spacer()
                
            }
            
        }
        .onAppear {
            thumbnail = item.thumbnail
            title = item.title
            date = item.pubDate
            description = item.itemDescription
        }
    }
}

//struct ItemDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
////        ItemDescriptionView(title: "Arts and Culture", date: "2020-10-21 18:42:56", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo", thumbnail: "defaultImage")
//    }
//}

/**
 HStack {
     Image(systemName: "heart.circle.fill")
         .foregroundColor(Color.red)
     Image(systemName: "calendar")
         .foregroundColor(Color.red)
         //.frame(height: 200)
     Image(systemName: "arrowshape.turn.up.right.fill")
         .foregroundColor(Color.red)
 }
 
 */
