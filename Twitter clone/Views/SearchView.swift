//
//  SearchView.swift
//  Twitter clone
//
//  Created by macbook on 1/25/21.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - Properties
    
    @State var searchText = ""
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            // Cells
            VStack(alignment: .leading) {
                ForEach(0..<10) { _ in
                    HStack { Spacer() }
                    UserCell()
                }
            }.padding(.leading)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
