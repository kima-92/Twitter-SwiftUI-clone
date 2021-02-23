//
//  NewTweetView.swift
//  Twitter clone
//
//  Created by macbook on 2/22/21.
//

import SwiftUI

struct NewTweetView: View {
    
    // MARK: - Properties
    
    @Binding var isPresented: Bool
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    
                    Text("What's happening?")
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(leading:
                                        Button(action: { isPresented.toggle()
                                        }, label: {
                                            Text("Cancel")
                                                .foregroundColor(.blue)
                                        }),
                                    trailing: Button(action: {}, label: {
                                        Text("Tweet")
                                            .padding(.horizontal)
                                            .padding(.vertical, 8)
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .clipShape(Capsule())
                                }))
                
                Spacer()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPresented: .constant(true))
    }
}
