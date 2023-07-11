//
//  Course.swift
//  CourseList-MVVM
//
//  Created by MikhaiL on 09.07.2023.
//

import Foundation

struct Course: Decodable {
    let name: String
    let imageUrl: String
    let numberOfLessons: Int
    let numberOfTests: Int
}

extension Course {
    static func getCourse() -> Course {
        Course(
            name: "Course Name",
            imageUrl: "https://swiftbook.ru//wp-content/uploads/2018/03/2-courselogo.jpg",
            numberOfLessons: 40,
            numberOfTests: 10
        )
    }
}
