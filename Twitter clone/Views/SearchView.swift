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
    @ObservedObject var viewModel = SearchViewModel()
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            // Cells
            VStack(alignment: .leading) {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filter(searchText)) { user in
                    HStack { Spacer() }
                    NavigationLink(
                        destination: LazyView(UserProfileView(user: user)),
                        label: {
                            UserCell(user: user)
                        })
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
