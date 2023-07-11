//
//  DataManager.swift
//  CourseList-MVVM
//
//  Created by MikhaiL on 11.07.2023.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults.standard
    
    func saveFavouriteStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }
    
    func loadFavouriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
}
