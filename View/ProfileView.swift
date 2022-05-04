//
//  ProfileView.swift
//  Wasanii
//
//  Created by mroot on 03/05/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .opacity(0.1)
                    .ignoresSafeArea()
               
                VStack {
                    Rectangle()
                        .frame(height: 0)
                        .background(Color.red.opacity(0.8))
//                    Text("Your Event")
//                        .padding()
                    List {
                        
                    }.background(Color.purple.ignoresSafeArea())
                        .opacity(0.1)
                        .onAppear {
                            UITableView.appearance().backgroundColor = .clear
                        }
                    Spacer()
                }
                .navigationTitle("Profile")
                .font(.title2)
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
