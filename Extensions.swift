//
//  Trim.swift
//  Wasanii
//
//  Created by mroot on 03/05/2022.
//

import Foundation
import SwiftUI


//MARK: -Date Converter
extension Date {
    func formatStringDate(date: String) -> String {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let newDate = dateFormatter.date(from: date)
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
            return dateFormatter.string(from: newDate!)
    }
}

//MARK: -Color
extension Color {
    static let newPrimaryColor = Color("colorPrimary")
}


//MARK: -Item Card View
struct itemModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            //.shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
            .padding(.bottom, 10)
            .cornerRadius(20)
            .frame(maxWidth: .infinity, alignment: .center)
            //.background(Color.newPrimaryColor.opacity(0.1))
    }
}
extension View {
    func ItemList() -> some View {
        modifier(itemModifier())
    }
}


//MARK: -TabView Controller
struct Tabs<Label: View>: View {
  @Binding var tabs: [String] // The tab titles
  @Binding var selection: Int // Currently selected tab
  let underlineColor: Color // Color of the underline of the selected tab
  // Tab label rendering closure - provides the current title and if it's the currently selected tab
  let label: (String, Bool) -> Label

  var body: some View {
    // Pack the tabs horizontally and allow them to be scrolled
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 30) {
        ForEach(tabs, id: \.self) {
          self.tab(title: $0)
        }
      }.padding(.horizontal, 3) // Tuck the out-most elements in a bit
  }
  }

  private func tab(title: String) -> some View {
    let index = self.tabs.firstIndex(of: title)!
    let isSelected = index == selection
    return Button(action: {
      // Allows for animated transitions of the underline,
      // as well as other views on the same screen
      withAnimation {
         self.selection = index
      }
    }) {
      label(title, isSelected)
            .borderedCaption()
//        .overlay(Rectangle() // The line under the tab
//          .frame(height: 2)
//           // The underline is visible only for the currently selected tab
//            .foregroundColor(isSelected ? underlineColor : .clear)
//          .padding(.top, 2)
//          // Animates the tab selection
//          .transition(.move(edge: .bottom)) ,alignment: .bottomLeading)
    }
  }
}


//trim text when searching
extension  String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
