//
//  ContentView.swift
//  practiceapp
//
//  Created by Silvana Tekia on 14/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack {
                cityTextView(cityname: "London")
                
                MainWeatherStausView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperture: 17)
                
                HStack (spacing:20) {
                    weatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperture: 16)
                    
                    weatherDayView(dayOfWeek: "WED", imageName: "wind.snow", temperture: 7)
                    
                    weatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperture: 19)
                    
                    weatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperture: 17)
                    
                    weatherDayView(dayOfWeek: "SAT", imageName: "snow", temperture: -1)
                    
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, background: .white)
                    
                }
                Spacer()
            
        }
    }
}



}

struct weatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperture: Int
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperture)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}


struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors:[topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct cityTextView: View {
    var cityname: String
    
    var body: some View {
        VStack {
            Text(cityname)
                .font(.system(size: 40, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            
           
            }
            
        }
    }

struct MainWeatherStausView: View {
    
    var imageName: String
    var temperture: Int
    
    var body: some View {
        VStack (spacing: 8){
       Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height:180)
            
            Text("\(temperture)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
                .padding(.bottom,40)
            
           
            
        }
    }
}
