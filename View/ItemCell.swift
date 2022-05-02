////
////  ItemCell.swift
////  Wasanii
////
////  Created by mroot on 02/05/2022.
////
//
//import SwiftUI
//
//struct ItemCell: View {
//
//    let name: String
//    let status: Status
//    let images: String
//
//    var body: some View {
//
//        HStack {
//            AsyncImage(url: URL(string: images)) { image in
//                image.resizable()
//            } placeholder: {
//                ProgressView()
//            } .frame(width: 90, height: 90)
//
//            VStack(alignment: .leading) {
//                Text(name)
//                    .font(.title)
//                Text(status.rawValue)
//                        .font(.subheadline)
//                        .foregroundColor(statusColor(status: status))
//            }
//        }
//    }
//}
//
//struct ItemCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemCell()
//    }
//}
