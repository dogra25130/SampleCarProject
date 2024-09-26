//
//  ImageLabelView.swift
//  Yral
//
//  Created by Abhishek Dogra on 25/09/24.
//

import SwiftUI
struct ImageLabelView: View {
    let data: ImageLabelInfoModel
    let titleFontWeight: FontWeight
    let titleFontSize: FontSize
    let spacing: CGFloat
    var body: some View {
        HStack(spacing: spacing) {
            Image(data.imageURL)
                .resizable()
                .frame(width: data.imageWidth,
                       height: data.imageHeight)
            Text(data.title)
                .font(.setFont(titleFontWeight, titleFontSize))
                .fixedSize()
        }
    }
}
