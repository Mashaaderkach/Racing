//
//  Settings.swift
//  Racing
//
//  Created by Maryia Dziarkach on 21.05.24.
//

import UIKit

final class Settings: Codable {

    var currentCarName: String
    var currentObstacleName: String
    var userName: String
    
    // передаю начальные значения для свойства currentCarName, свойства currentObstacleName и свойства userName
    init(currentCarName: String, currentObstacleName: String, userName: String) {
        self.currentCarName = currentCarName
        self.currentObstacleName = currentObstacleName
        self.userName = userName
    }
}
