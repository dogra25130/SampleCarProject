//
//  Utils+Extensions.swift
//  Yral
//
//  Created by Abhishek Dogra on 25/09/24.
//

import SwiftUI
import Foundation

class Utils {
    static func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }

}
