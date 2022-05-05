//
//  CategorySliderView.swift
//  Wasanii
//
//  Created by mroot on 05/05/2022.
//

import SwiftUI

struct CategorySliderView: View {
    
    @StateObject var itemViewModel = ItemViewModel(service: ItemService())
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                Button {
                    
                    Task {
                        await itemViewModel.getCategory(url:APIConstants.baseUrl.appending(APIConstants.artCategory))
                    }
                    
                    print("art-exhibits")
                } label: {
                    Text("All")
                        .borderedCaption()
                }
                Button {
                    print("art-exhibits")
                } label: {
                    Text("Art")
                        .borderedCaption()
                }
                Button {
                    print("concerts")
                } label: {
                    Text("Concerts")
                        .borderedCaption()
                }
                Button {
                    print("movies")
                } label: {
                    Text("Movies")
                        .borderedCaption()
                }
                Button {
                    print("theater-performances")
                } label: {
                    Text("Theater")
                        .borderedCaption()
                }
                Button {
                    print("charity")
                } label: {
                    Text("Charity")
                        .borderedCaption()
                }

            }
        }
    }
}

struct CategorySliderView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySliderView()
    }
}


struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13, weight: .bold, design: .default))
            .padding(10)
            .frame(width: 80)
            .foregroundColor(.white)
            .background(Color.newPrimaryColor)
            .cornerRadius(20)
            
    }
}

extension View {
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
}
