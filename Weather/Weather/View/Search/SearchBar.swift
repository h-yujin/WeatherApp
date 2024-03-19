//
//  SearchBar.swift
//  Weather
//
//  Created by Hong yujin on 3/19/24.
//
import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    @Binding var shouldBecomFirstResponder: Bool
    
    init(text: Binding<String>,
         shouldBecomFirstResponder: Binding<Bool>) {
        self._text = text
        self._shouldBecomFirstResponder = shouldBecomFirstResponder
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text,
                    shouldBecomFirstResponder: $shouldBecomFirstResponder)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ searchBar: UISearchBar, context: Context) {
        DispatchQueue.main.async {
            if shouldBecomFirstResponder {
                searchBar.becomeFirstResponder()
            } else {
                searchBar.resignFirstResponder()
            }
        }
    }
}

extension SearchBar {
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        @Binding var shouldBecomFirstResponder: Bool
        
        init(text: Binding<String>,
             shouldBecomFirstResponder: Binding<Bool>) {
            self._text = text
            self._shouldBecomFirstResponder = shouldBecomFirstResponder
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            self.text = searchBar.text ?? ""
            self.shouldBecomFirstResponder = false
        }
        
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            self.shouldBecomFirstResponder = true
        }
        
    }
}
