//
//  ContentView.swift
//  color_test
//
//  Created by raiu on 2019/11/21.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("This is Color.blue")
                .frame(width: 200, height: 200)
                .background(Color.blue)
            
            Text("This is UIColor.blue")
                .frame(width: 200, height: 200)
                .background(Color(UIColor.blue))
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
