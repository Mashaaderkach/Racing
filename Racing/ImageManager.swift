//
//  ImageManager.swift
//  Racing
//
//  Created by Maryia Dziarkach on 27.05.24.
//

import Foundation
import UIKit

final class ImageManager {
    private let key = "imageArray"
    
    func saveImageName( _ imageName: String) {
        if var array = UserDefaults.standard.object(forKey: key) as? [String] {
            array.append(imageName)
            UserDefaults.standard.setValue(array, forKey: key)
        } else {
            let array = [imageName]
            UserDefaults.standard.setValue(array, forKey: key)
        }
    }
    
    
    func loadImageName() -> [String] {
        return UserDefaults.standard.value(forKey: key) as? [String] ?? []
    }
}
