//
//  NetworkManager.swift
//  CourseList-MVVM
//
//  Created by MikhaiL on 09.07.2023.
//

import Foundation

enum NetworkError: Error {
    case noData
    case invalidURL
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCourses() async throws -> [Course] {
        guard let url = URL(string: API.courseURL.rawValue) else {
            throw NetworkError.invalidURL
        }
        
        /// Параметр data(from:) - Откуда загрузить данные?
        /// Возвращает кортеж из (Данные, Ответ от сервера)
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let courses = try? decoder.decode([Course].self, from: data) else {
            throw NetworkError.decodingError
        }
        return courses
    }
}

enum API: String {
    case courseURL = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
}
