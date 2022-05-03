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
        AsyncImage(url: URL(string: thumnail)) { phase in
                if let image = phase.image {
                    // Displays the loaded image.
                    image.resizable().frame(width: 150, height: 150)
                        .cornerRadius(20)
                        
//                } else if phase.error != nil {
//                    Color.red // Indicates an error.
                } else {
                    // Acts as a placeholder.
                    Image("defaultImage")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(20)
                }
            }
            VStack(alignment: .leading) {
                
                Text(title)
                .bold()
                .lineLimit(1)
                .fixedSize(horizontal: false, vertical: true)
                
                //Spacer(minLength: 20)
                
                Text("Nairobi Cinema")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                
                
                Text( Date().formatStringDate(date: date))
                    .italic()
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .trailing) {
                Image(systemName: "heart")
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell(title: "Event", thumnail: "image", date: "")
        
    }
}
