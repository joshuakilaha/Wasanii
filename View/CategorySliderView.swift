//
//  CategorySliderView.swift
//  Wasanii
//
//  Created by mroot on 05/05/2022.
//

import SwiftUI

struct CategorySliderView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                Button {
                    print("Arts")
                } label: {
                    Text("Art")
                        .borderedCaption()
                }
                Button {
                    print("Arts")
                } label: {
                    Text("Concert")
                        .borderedCaption()
                }
                Button {
                    print("Arts")
                } label: {
                    Text("Music")
                        .borderedCaption()
                }
                Button {
                    print("Arts")
                } label: {
                    Text("Sports")
                        .borderedCaption()
                }
                Button {
                    print("Arts")
                } label: {
                    Text("Cars")
                        .borderedCaption()
                }
                Button {
                    print("Arts")
                } label: {
                    Text("News")
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
            .font(.caption2)
            .padding(10)
            .frame(width: 80)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.blue)
    }
}

extension View {
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
}
