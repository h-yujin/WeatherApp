//
//  WeakView.swift
//  Weather
//
//  Created by Hong yujin on 3/18/24.
//

import SwiftUI
import Kingfisher

struct WeakView: View {
    @StateObject var viewModel: WeakViewModel
    
    var body: some View {
        switch viewModel.phase {
        case .notRequested:
            PlaceholderView()
                .onAppear{
                    viewModel.send(action: .getForecast)
                }
        case .loading:
            LoadingView()
        case .success:
            ScrollView(.vertical) {
                ForEach(viewModel.forecast, id: \.id) { item in
                    CellView(item: item)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 5)
                }
            }
            .background(Color.skyBg)
        case .fail(let error):
            ErrorView(errorMessage: error.localizedDescription)
        }
    }
}

fileprivate struct CellView: View {
    let item: Weather
    
    var body: some View {
        HStack(spacing: 5) {
            Text(item.dateText?.toDate() ?? "11")
                .foregroundColor(.black)
                .font(.system(size: 14))
                .padding(.leading, 20)
                .frame(minWidth: 0, maxWidth: .infinity)
            
            KFImage(URL(string: item.iconUrl ?? ""))
                .resizable()
                .frame(width: 40, height: 40)
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding(10)
            
            Text("\(Int(item.temp ?? 0))°C")
                .foregroundColor(.black)
                .font(.system(size: 12, weight: .bold))
                .padding(.trailing, 20)
                .frame(minWidth: 0, maxWidth: .infinity)
            
        }
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
    WeakView(viewModel: .init(container: DIContainer(services: StubService())))
}
