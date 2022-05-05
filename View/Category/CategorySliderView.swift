//
//  CategorySliderView.swift
//  Wasanii
//
//  Created by mroot on 05/05/2022.
//

import SwiftUI

//
//struct CategorySliderView: View {
//
//    @State private var selectedTab: Int = 0
//
//    var body: some View {
//        VStack {
//            Picker("", selection: $selectedTab) {
//                Text("ALL")
//                    .tag(0)
//                Text("Art").tag(1)
//                Text("Concerts").tag(2)
//            }
//            //.borderedCaption()
//            .pickerStyle(SegmentedPickerStyle())
//
//            switch(selectedTab) {
//                case 0: SearchView()
//                case 1: AlertView()
//                case 2: ProfileView()
//
//            default:
//                EmptyView()
//            }
//        }
//    }
//}



struct CategorySliderView: View {

    enum Category {
       // case all
        case art
        case movie
    }
    
    @State private var showView = false //View Presentation to AddView
    @State private var selectedTab: Int = 0
    
    @State var category: Category = .art
    


    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                
                Tabs(tabs: .constant(["All", "Art", "Concert", "Movie", "Plays","Charity","Open Mic","Festival","Lectures","Fashion","Parties","Classes","Out of Town"]), selection: $selectedTab, underlineColor: .black) { title, isSelected in
                           
                    Text(title)
                        .borderedCaption()
                        .foregroundColor(isSelected ? .black : .gray)
                }
                Spacer()
                
                switch(selectedTab) {
                    case 0: HomeView()
                    case 1: ArtView()
                    case 2: ConcertView()
                    case 3: MovieView()
                    case 4: PlaysView()
                    case 5: CharityView()
                    case 6: OpenMicView()
                    case 7: FestivalView()
                    case 8: LecturesView()
                    case 9: FashionView()
                    case 10: PartiesView()
                    case 11: ClassesView()
                    case 12: OutofTownView()

                default:
                    HomeView()
                }
            }
            .navigationTitle("Events")
        }
        
        
        
//        switch category {
//        case .art:
//            ArtView()
//        case .movie:
//            ProfileView()
//        }
        
        
//        ScrollView(.horizontal, showsIndicators: false) {
//
//                HStack(alignment: .center) {
//                    Button {
//                        showView.toggle()
//                    } label: {
//                        Text("All")
//                            .borderedCaption()
//                    }
//                    Button {
//                        print("art-exhibits")
//                    } label: {
//                        Text("Art")
//                            .borderedCaption()
//                    }
//                    Button {
//                        print("concerts")
//                    } label: {
//                        Text("Concerts")
//                            .borderedCaption()
//                    }
//                    Button {
//                        print("movies")
//                    } label: {
//                        Text("Movies")
//                            .borderedCaption()
//                    }
//                    Button {
//                        print("theater-performances")
//                    } label: {
//                        Text("Theater")
//                            .borderedCaption()
//                    }
//                    Button {
//                        print("charity")
//                    } label: {
//                        Text("Charity")
//                            .borderedCaption()
//                    }
//
//                }
//            }
//        .sheet(isPresented: $showView) {
//            ArtView()
      //  }
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
