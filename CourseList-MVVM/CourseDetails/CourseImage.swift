//
//  CourseImage.swift
//  CourseList-MVVM
//
//  Created by MikhaiL on 11.07.2023.
//

import SwiftUI

struct CourseImage: View {
    let imageUrl: URL
    let imageSize: CGSize
    let cornerRadius: CGFloat
    let shadowIsOn: Bool
    
    var body: some View {
        AsyncImage(url: imageUrl) { image in
            image
                .resizable()
                .frame(width: imageSize.width, height: imageSize.height)
                .cornerRadius(cornerRadius)
                .shadow(radius: shadowIsOn ? 10 : 0)
        } placeholder: {
            Image(systemName: "xmark.shield")
                .resizable()
                .frame(width: imageSize.width, height: imageSize.height)
        }
    }
}

struct CourseImage_Previews: PreviewProvider {
    static var previews: some View {
        CourseImage(
            imageUrl: URL(string: "https://swiftbook.ru/wp-content/uploads/2018/03/2-courselogo.jpg")!,
            imageSize: CGSize(width: 230, height: 180),
            cornerRadius: 30,
            shadowIsOn: true
        )
    }
}
