//
//  ContentView.swift
//  Twitter clone
//
//  Created by macbook on 1/23/21.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - Body
    
    var body: some View {
        Group {
            
            // Display the Main User interface
            // if the user is Logged In
            if viewModel.userSession != nil {
                NavigationView {
                    TabView {
                        // Home Tab
                        FeedView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        // Search Tab
                        SearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        // Messages Tab
                        ConversationsView()
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Messages")
                            }
                    }
                    // Bar title
                    .navigationBarTitle("Home")
                    
                    // Sign out bar button item
                    .navigationBarItems(leading: Button(
                                            action: {
                        viewModel.signOut()
                    },
                                            label: {
                        if let user = viewModel.user {
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .frame(width: 32, height: 32)
                                .cornerRadius(16)
                        }
                    }))
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                // If User is logged out, display the LoginView
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
