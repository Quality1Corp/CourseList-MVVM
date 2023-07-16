//
//  CourseDetailsView.swift
//  CourseList-MVVM
//
//  Created by MikhaiL on 11.07.2023.
//

import SwiftUI

struct CourseDetailsView: View {
    @StateObject var viewModel: CourseDetailsViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.courseName)
                .font(.largeTitle)
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    CourseImage(
                        imageUrl: viewModel.imageUrl,
                        imageSize: CGSize(width: 230, height: 180),
                        cornerRadius: 30,
                        shadowIsOn: true
                    )
                    FavoriteStatusButton(isFavorite: viewModel.isFavorite) {
                        viewModel.favoriteButtonPressed()
                    }
                    .offset(x: 115, y: 60)
                }
                Text(viewModel.numberOfLessons).font(.headline)
                Text(viewModel.numberOfTest).font(.headline)
            }
            Spacer()
        }
    }
}

struct FavoriteStatusButton: View {
    var isFavorite: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(isFavorite ? .red : .gray)
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailsView(viewModel: CourseDetailsViewModel(course: Course.getCourse()))
    }
}
