//
//  NetworkErrorView.swift
//  Wasanii
//
//  Created by mroot on 10/05/2022.
//

import SwiftUI

struct NetworkErrorView: View {
    
    let netStatus: String
    let image: String
    
    
    var body: some View {
        HStack {
                   Text(netStatus)
                       .padding()
                   Image(systemName: image)
                   
                   Spacer()
                   
                   Button {
                       print("retry button")
                   } label: {
                       Text("Retry")
                           .padding()
                           .font(.headline)
                           .foregroundColor(Color(.systemBlue))
                   }
                   .frame(width: 80, height: 25)
                   .background(Color.white)
                   .clipShape(Capsule())
                   .padding()

               }
               .background(Color.red)
    }
}

struct NetworkErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkErrorView(netStatus: "Not Connected", image: "wifi.slash")
    }
}
