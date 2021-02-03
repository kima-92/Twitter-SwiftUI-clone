//
//  ContentView.swift
//  Twitter clone
//
//  Created by macbook on 1/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
