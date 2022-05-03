//
//  Trim.swift
//  Wasanii
//
//  Created by mroot on 03/05/2022.
//

import Foundation
extension  String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
