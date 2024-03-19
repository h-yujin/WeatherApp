//
//  HomeView.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @EnvironmentObject var container: DIContainer
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        switch viewModel.phase {
        case .notRequested:
            PlaceholderView()
                .onAppear{
                    viewModel.send(action: .getWeather)
                }
        case .loading:
            LoadingView()
        case .success:
            VStack {
                detailView
                    .padding(.top, 50)
                listView
                    .padding(.bottom, 50)
            }
            .background(Color.coralBg)
        case .fail(let error):
            ErrorView(errorMessage: error.localizedDescription)
        }
    }
    
    
    var detailView: some View {
        VStack(spacing: 15) {
            Text(Date().toDateString)
                .foregroundColor(.black)
                .font(.system(size: 17))
                .padding(.top, 50)
            
            KFImage(URL(string: viewModel.weather?.iconUrl ?? ""))
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.top, 20)
                .padding(.bottom, 40)
            
            Text(viewModel.weather?.description ?? "")
                .foregroundColor(.black)
                .font(.system(size: 17, weight: .bold))
            
            Text("현재기온 \(Int(viewModel.weather?.temp ?? 0))°C")
                .foregroundColor(.black)
                .font(.system(size: 14))
            
            Text("최고기온 \(Int(viewModel.weather?.tempMax ?? 0))°C")
                .foregroundColor(.black)
                .font(.system(size: 14))
            
            Text("최저기온 \(Int(viewModel.weather?.tempMin ?? 0))°C")
                .foregroundColor(.black)
                .font(.system(size: 14))
            
            Text("습도 \(Int(viewModel.weather?.humidity ?? 0))%")
                .foregroundColor(.black)
                .font(.system(size: 14))
                .padding(.bottom, 50)
            
            
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
                ForEach(viewModel.forecast, id: \.id) { item in
                    CellView(item: item)
                }
            }
            .padding(.horizontal, 20)
            .frame(height: 200)
        }
        .scrollIndicators(.hidden)
    }
}



fileprivate struct CellView: View {
    let item: Weather

    var body: some View {
        VStack(spacing: 5) {
            Text(item.dateText?.toHourMinute() ?? "")
                .foregroundColor(.black)
                .font(.system(size: 14))
                .padding(.top, 20)

            KFImage(URL(string: item.iconUrl ?? ""))
                .resizable()
                .frame(width: 30, height: 30)

            Text("\(Int(item.temp ?? 0))°C")
                .foregroundColor(.black)
                .font(.system(size: 12))
                .padding(.bottom, 10)

        }
        .frame(width: 100)
        .background(.white)
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
                .opacity(0.3)
        }
    }
}
#Preview {
    HomeView(viewModel: .init(container: .init(services: StubService())))
}
