//
//  CourseListView.swift
//  CourseList-MVVM
//
//  Created by MikhaiL on 09.07.2023.
//

import SwiftUI

struct CourseListView: View {
    /// Подписчик класса CourseListViewModel
    @StateObject private var viewModel = CourseListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.rows, id: \.courseName) { courseDetailsViewModel in
                NavigationLink(destination: CourseDetailsView(viewModel: courseDetailsViewModel)) {
                    RowView(viewModel: courseDetailsViewModel)
                }
            }
            .navigationTitle("Courses")
        }
        // Для вызова асинхронных методов
        .task {
            await viewModel.fetchCourses()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
