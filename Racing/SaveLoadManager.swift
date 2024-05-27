//
//  SaveLoadManager.swift
//  Racing
//
//  Created by Maryia Dziarkach on 26.05.24.
//

import Foundation
import UIKit

final class SaveLoadManager {
    
    func saveImage( _ image: UIImage) -> String? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil }
    
        let fileName = UUID().uuidString
        
        let fileURL = directory.appendingPathComponent(fileName) // к директории добавилось имя файла
        
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            try? FileManager.default.removeItem(atPath: fileURL.path)
        }
        
        guard let data = image.jpegData(compressionQuality: 1.0) else { return nil }
        
        do {
            try data.write(to: fileURL)
            return fileName
        } catch let error {
            print("Error \(error.localizedDescription)")
            return nil
        }
    }
    
    
     func load(from name: String) -> UIImage? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let fileURL = directory.appendingPathComponent(name)
        
        let image = UIImage(contentsOfFile: fileURL.path)
        return image
    }
}
