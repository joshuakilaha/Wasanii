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
