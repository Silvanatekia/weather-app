//
//  WeatherButton.swift
//  practiceapp
//
//  Created by Silvana Tekia on 14/12/2023.
//
import SwiftUI

import Foundation

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var background: Color
    
    var body: some View {
        Text(title)
            .frame(width: 260, height: 40)
            .foregroundColor(textColor)
            .background(background)
            .font(.system(size: 20,weight:.bold,design: .default))
            .cornerRadius(10)
        
    }
}
