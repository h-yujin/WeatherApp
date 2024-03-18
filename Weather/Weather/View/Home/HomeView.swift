//
//  HomeView.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var container: DIContainer
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Spacer(minLength: 50)
            detailView
            Spacer(minLength: 50)
            listView
            Spacer(minLength: 60)
        }
        .background(Color.coralBg)
        .onAppear{
            viewModel.send(action: .getWeather)
        }
    }
    
    
    var detailView: some View {
        VStack(spacing: 15) {
            Text("오늘 날짜")
                .foregroundColor(.black)
                .font(.system(size: 17))
                
            
            Image(systemName: "sun.max")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(.top, 20)
                .padding(.bottom, 40)
            
            Text(viewModel.weather?.description ?? "")
                .foregroundColor(.black)
                .font(.system(size: 17))
            
            Text("Current \(Int(viewModel.weather?.temp ?? 0))°C")
                .foregroundColor(.black)
                .font(.system(size: 14))
            
            Text("Highest \(Int(viewModel.weather?.tempMax ?? 0))°C")
                .foregroundColor(.black)
                .font(.system(size: 14))
            
            Text("Lowest \(Int(viewModel.weather?.tempMin ?? 0))°C")
                .foregroundColor(.black)
                .font(.system(size: 14))
            
            Text("Humidity \(Int(viewModel.weather?.humidity ?? 0))%")
                .foregroundColor(.black)
                .font(.system(size: 14))
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    
    
    var listView: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.todays, id: \.id) { today in
                    VStack(spacing: 5) {
                        Text("시간")
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                            .padding(.top, 20)
                        
                        Image(systemName: "sun.max")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        Text("discription")
                            .foregroundColor(.black)
                            .font(.system(size: 12))
                            .padding(.bottom, 10)
                        
                    }
                    .frame(width: 100)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                            .opacity(0.3)
                    }
                }
            }
            .padding(.horizontal, 20)
            .frame(height: 100)
        }
    }
}

#Preview {
    HomeView(viewModel: .init(container: .init(services: StubService())))
}
