//
//  CategorySliderView.swift
//  Wasanii
//
//  Created by mroot on 05/05/2022.
//

import SwiftUI

struct CategorySliderView: View {
    
    @State private var selectedCategory: Int = 0
    

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                
                //MARK: -Top navigation slider
                Tabs(tabs: .constant(["All", "Art", "Concert", "Movie", "Plays", "Charity", "Festival", "Classes","Lectures", "Fashion", "Parties", "Open Mic", "Out of Town"]), selection: $selectedCategory, underlineColor: .black) { title, isSelected in
                           
                    Text(title)
                        .borderedCaption()
                        .foregroundColor(isSelected ? .black : .gray)
                }
                
                //MARK: -Category views
                switch(selectedCategory) {
                    case 0: HomeView()
                    case 1: ArtView()
                    case 2: ConcertView()
                    case 3: MovieView()
                    case 4: PlaysView()
                    case 5: CharityView()
                    case 6: FestivalView()
                    case 7: ClassesView()
                    case 8: LecturesView()
                    case 9: FashionView()
                    case 10: PartiesView()
                    case 11: OpenMicView()
                    case 12: OutofTownView()

                default:
                    HomeView()
                }
                
                Spacer()
            }
            .navigationTitle("Events")
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
