//
//  _input_post.swift
//  post
//
//  Created by raiu on 2019/11/01.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct _input_post: View {
    @State var inputText = ""
    
    var body: some View {
        VStack {
            TextField("input", text: $inputText, onEditingChanged: { (changed) in
                print("onEditingChanged : \(changed)")
            }, onCommit: {
                print("onCommit")
                print(self.inputText)
            })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .border(Color.black, width: 1)
        }
    }
}

struct _input_post_Previews: PreviewProvider {
    static var previews: some View {
        _input_post()
    }
}
