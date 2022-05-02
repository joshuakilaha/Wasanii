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

    var body: some View {

        VStack(alignment: .center) {
        AsyncImage(url: URL(string: thumnail)) { phase in
                if let image = phase.image {
                    // Displays the loaded image.
                    image.resizable().frame(height: 250)
                } else if phase.error != nil {
                    Color.red // Indicates an error.
                } else {
                    // Acts as a placeholder.
                    Image("defaultImage")
                        .resizable()
                        .frame(height: 250)
                }
            }

            VStack(alignment: .leading) {
                Text(title)
                    //.font(.title)
            }
        }
    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell(title: "Event", thumnail: "image")
    }
}
