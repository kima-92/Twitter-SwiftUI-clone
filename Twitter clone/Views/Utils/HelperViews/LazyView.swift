//
//  LazyView.swift
//  Twitter clone
//
//  Created by macbook on 3/23/21.
//

import SwiftUI

// A View that loads only when it's time to display on screen
struct LazyView<Content:View>: View {
    
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
