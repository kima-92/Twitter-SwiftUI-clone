//
//  NewMessageView.swift
//  Twitter clone
//
//  Created by macbook on 2/3/21.
//

import SwiftUI

struct NewMessageView: View {
    
    // MARK: - Properties
    
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    
    @ObservedObject var viewModel = SearchViewModel()
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            // Cells (Buttons)
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                    HStack { Spacer() }
                    
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
                    }, label: {
                        UserCell(user: user)
                    })
                }
            }.padding(.leading)
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true), startChat: .constant(true))
    }
}
