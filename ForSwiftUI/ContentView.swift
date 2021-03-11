//
//  ContentView.swift
//  ForSwiftUI
//
//  Created by Zhaoyang Li on 3/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inNight = true
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: inNight ? .blue : .black, bottomColor: inNight ? .white : .gray, sideColor: inNight ? .red : .black)
            
            VStack {
                CityNameView(cityName: "CItyName Here")
                MainCityWeatherView(imageName: inNight ? "cloud.sun.fill" : "moon.stars.fill", temperature: 70)
                
                Spacer() // how much space does spacer gives??
                
                HStack(spacing: 20) {
                    WeatehrDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 66)
                    WeatehrDayView(dayOfWeek: "WED", imageName: "wind.snow", temperature: 77)
                    WeatehrDayView(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 88)
                    WeatehrDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 99)
                    WeatehrDayView(dayOfWeek: "SAT", imageName: "wind.snow", temperature: 55)
                }
                
                Spacer()
                
                Button {
                    print("Tapped")
                    inNight.toggle()
                } label: {
                    Text("Change View")
                        .frame(width: 250, height: 50, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .cornerRadius(10)
                } .contentShape(Rectangle())
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatehrDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text(dayOfWeek)
                .font(.system(size: 25))
                .foregroundColor(.white)
            
            
            Text("\(temperature)°")
                .font(.system(size: 28))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    var sideColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, sideColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityNameView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainCityWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70))
                .foregroundColor(.white)
        }
    }
}
