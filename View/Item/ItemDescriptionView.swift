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
        
        GeometryReader { geo in

            ScrollView {
                //MARK: -Image Loader
                    AsyncImage(url: URL(string: thumbnail)) { phase in
                            if let image = phase.image {
                                // Displays the loaded image.
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: geo.size.width * 1.0, height: geo.size.height * 0.7)
                                    .background(Color.black)
                                    .opacity(0.9)

                            } else {
                                // Acts as a placeholder.
                                Image("defaultImage")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geo.size.width * 1.0, height: geo.size.height * 0.5)
                                    .background(Color.black)
                                    .opacity(0.9)
                            }
                    }
                    VStack(alignment: .leading) {
                        
                        //MARK: -Title
                        Text(title)
                            .font(.title)
                            .bold()
                            .padding(.bottom, 5)

                        //MARK: -Date
                        Text(Date().formatStringDate(date: date))
                            .foregroundColor(.gray)
                            .italic()

                    } .padding()

                    Divider()
                        .frame(width: 400, height: 1)
                        .background(Color.newPrimaryColor)

                    VStack(alignment: .leading) {
                        Text("Event Details")
                            .font(.title)
                            .bold()
                            .padding(.bottom, 10.0)

                        //MARK: -Description
                        Text(description)
                    } .padding()

                Spacer()

            } .ignoresSafeArea()
        } .onAppear {
            thumbnail = item.thumbnail
            title = item.title
            date = item.pubDate
            description = item.itemDescription
        }
    }
}


/**
struct ItemDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDescriptionView(item: Item.dummyData.first!)
    }
}

 */
