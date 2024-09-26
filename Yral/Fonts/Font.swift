//
//  Font.swift
//  Yral
//
//  Created by Abhishek Dogra on 25/09/24.
//

import SwiftUI

enum FontWeight: String {
    case thin100 = "Barlow-Thin"
    case extraLight200 = "Barlow-ExtraLight"
    case light300 = "Barlow-Light"
    case regular400 = "Barlow-Regular"
    case medium500 = "Barlow-Medium"
    case semiBold600 = "Barlow-SemiBold"
    case bold700 = "Barlow-Bold"
    case extraBold800 = "Barlow-ExtraBold"
    case black900 = "Barlow-Black"
    case thinItalic100 = "Barlow-ThinItalic"
    case extraLightItalic200 = "Barlow-ExtraLightItalic"
    case lightItalic300 = "Barlow-LightItalic"
    case italic400 = "Barlow-Italic"
    case mediumItalic500 = "Barlow-MediumItalic"
    case semiBoldItalic600 = "Barlow-SemiBoldItalic"
    case boldItalic700 = "Barlow-BoldItalic"
    case extraBoldItalic800 = "Barlow-ExtraBoldItalic"
    case blackItalic900 = "Barlow-BlackItalic"
}

enum FontSize: CGFloat {
    case font8 = 8.0
    case font10 = 10.0
    case font12 = 12.0
    case font14 = 14.0
    case font16 = 16.0
    case font18 = 18.0
    case font20 = 20.0
    case font22 = 22.0
    case font24 = 24.0
}

extension Font {
    static func setFont(_ fontType: FontWeight, _ size: FontSize) -> Font {
        Font.custom(fontType.rawValue, size: size.rawValue)
    }
}
