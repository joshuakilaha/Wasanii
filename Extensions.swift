//
//  Trim.swift
//  Wasanii
//
//  Created by mroot on 03/05/2022.
//

import Foundation
import SwiftUI
extension  String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension Date {
    func formatStringDate(date: String) -> String {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let newDate = dateFormatter.date(from: date)
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
            return dateFormatter.string(from: newDate!)
    }
}

extension Color {
    static let newPrimaryColor = Color("colorPrimary")
}


struct itemModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
            .padding(.all, 10)
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
