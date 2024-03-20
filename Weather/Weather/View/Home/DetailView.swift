//
//  DetailView.swift
//  Weather
//
//  Created by Hong yujin on 3/19/24.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    var title: String
    var weather: Weather = Weather()
    
    var body: some View {
        VStack(spacing: 15) {
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 17))
                .padding(.top, 50)
            
            KFImage(URL(string: weather.iconUrl ?? ""))
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.top, 20)
                .padding(.bottom, 40)
            
            Text(weather.description ?? "")
                .foregroundColor(.black)
                .font(.system(size: 17, weight: .bold))
            
            Text("현재기온 \(Int(weather.temp ?? 0))°C")
                .foregroundColor(.black)
                .font(.system(size: 14))
            
            Text("최고기온 \(Int(weather.tempMax ?? 0))°C")
                .foregroundColor(.black)
                .font(.system(size: 14))
            
            Text("최저기온 \(Int(weather.tempMin ?? 0))°C")
                .foregroundColor(.black)
                .font(.system(size: 14))
            
            Text("습도 \(Int(weather.humidity ?? 0))%")
                .foregroundColor(.black)
                .font(.system(size: 14))
                .padding(.bottom, 50)
        }
        .frame(width: UIScreen.main.bounds.width - 40, 
               height: 500)
        .background(.white)
        .cornerRadius(50)
        .overlay {
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
                .opacity(0.3)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    DetailView(title: "")
}
