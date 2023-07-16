//
//  CourseListViewModel.swift
//  CourseList-MVVM
//
//  Created by MikhaiL on 09.07.2023.
//

import SwiftUI

/*
 Протокол нужно объявлять только в качестве публичных интерфейсов,
 при работе в команде, чтобы регламентировать класс - что должно быть объявлено.
 */

/// Создаем из класса наблюдаемый объект - Протокол ObservableObject
final class CourseListViewModel: ObservableObject {
    /// Издатель, (является нативной реализацией Boxing)
    @Published var rows: [CourseDetailsViewModel] = []
    
    func fetchCourses() async {
        do {
            let courses = try await NetworkManager.shared.fetchCourses()
            await MainActor.run {
                rows = courses.map { CourseDetailsViewModel(course: $0) }
            }
        } catch {
            print(error)
        }
    }
}
