//
//  LeftAlignedTextView.swift
//  FetchTheMealDesserts
//
//  Created by Ralston Goes on 3/1/24.
//

import Foundation
import SwiftUI

enum AppTextStyle {
    case header
    case subHeader
    case regular
    
    var font: Font? {
        switch self {
        case .header:
            return .title
        case .subHeader:
            return .title2
        case .regular:
            return nil
        }
    }
    
    var fontWeight: Font.Weight? {
        switch self {
        case .header, .subHeader:
            return .bold
        case .regular:
            return nil
        }
    }
    
    var fontDesign: Font.Design? {
        switch self {
        case .header, .subHeader:
            return .rounded
        case .regular:
            return nil
        }
    }
}

struct LeftAlignedTextView: View {
    let text: String
    let style: AppTextStyle
    
    var body: some View {
        HStack {
            Text(text)
                .font(style.font)
                .fontWeight(style.fontWeight)
                .fontDesign(style.fontDesign)
            Spacer()
        }
    }
}
