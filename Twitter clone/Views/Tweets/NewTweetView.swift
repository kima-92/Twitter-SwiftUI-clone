//
//  NewTweetView.swift
//  Twitter clone
//
//  Created by macbook on 2/22/21.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    
    // MARK: - Properties
    
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    @ObservedObject var viewModel: UploadTweetViewModel
    
    // MARK: - Init
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.viewModel = UploadTweetViewModel(isPresented: isPresented)
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    // Profile Image
                    if let user = AuthViewModel.shared.user {
                        
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    }
                    TextArea("What's happening?", text: $captionText)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(
                    
                    // Cancel Button
                    leading:
                        Button(action: { isPresented.toggle()
                        }, label: {
                            Text("Cancel")
                                .foregroundColor(.blue)
                        }),
                    
                    // Tweet Button
                    trailing: Button(action: {
                        viewModel.uploadTweet(caption: captionText)
                    }, label: {
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
