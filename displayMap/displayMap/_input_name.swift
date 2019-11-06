//
//  _input_name.swift
//  displayMap
//
//  Created by raiu on 2019/11/06.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct _input_name: View {
    
    @State var name = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                TextField("Enter name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if name != "" {
                    NavigationLink(destination: _displayMap(name: self.name)) {
                        Text("Share Location")
                    }
                }
            }.navigationBarTitle("Location Shareing")
            
        }
    }
}

struct _input_name_Previews: PreviewProvider {
    static var previews: some View {
        _input_name()
    }
}
