//
//  ItemCell.swift
//  Wasanii
//
//  Created by mroot on 02/05/2022.
//

import SwiftUI

struct ItemCell: View {

    let title: String
    let thumnail: String
    let date: String
    

    var body: some View {

        HStack {
            
            //MARK: Image Loader
            AsyncImage(url: URL(string: thumnail)) { phase in
            if let image = phase.image {
                // Displays the loaded image.
                image
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(20)
            } else {
                // Acts as a placeholder.
                Image("defaultImage")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 120, height: 120)
            }
        }
            
        VStack(alignment: .leading) {
            
            //MARK: Title
            Text(title)
            .font(.system(size: 16, weight: .bold, design: .default))
            .lineLimit(3)
            
            
            //MARK: Date
            Text( Date().formatStringDate(date: date))
                .font(.system(size: 16, design: .default))
                .padding(.top, 8)
        }
        
        VStack(alignment: .trailing) {
            Image(systemName: "heart")
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
        }
        }.ItemList() //item design view

    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell(title: "Event", thumnail: "image", date: "2020-10-21 18:42:56")
        
    }
}

