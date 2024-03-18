//
//  ErrorView.swift
//  Weather
//
//  Created by Hong yujin on 3/19/24.
//

import SwiftUI

struct ErrorView: View {
    @State var errorMessage: String
    
    var body: some View {
        Text("오류가 발생했습니다!\n\(errorMessage)")
            .multilineTextAlignment(.center)
    }
}

#Preview {
    ErrorView(errorMessage: "")
}
