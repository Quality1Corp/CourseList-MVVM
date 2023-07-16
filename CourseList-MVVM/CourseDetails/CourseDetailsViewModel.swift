//
//  CourseDetailsViewModel.swift
//  CourseList-MVVM
//
//  Created by MikhaiL on 11.07.2023.
//

import Foundation

final class CourseDetailsViewModel: ObservableObject {
    var courseName: String {
        course.name
    }
    
    var imageUrl: URL {
        URL(string: course.imageUrl)!
    }
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons)"
    }
    
    var numberOfTest: String {
        "Number of tests: \(course.numberOfTests)"
    }
    
    @Published var isFavorite: Bool {
        didSet {
            DataManager.shared.saveFavouriteStatus(for: course.name, with: isFavorite)
        }
    }
    
    private let course: Course
    
    init(course: Course) {
        self.course = course
        isFavorite = DataManager.shared.loadFavouriteStatus(for: course.name)
    }
    
    func favoriteButtonPressed() {
        isFavorite.toggle()
    }
}
