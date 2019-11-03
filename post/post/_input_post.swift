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
            
            
            Button(action: {
                let urlString = "http://192.168.3.7:3000/"
                let url = URL(string: urlString)!
                print("URL : \(url)")
                let request = URLRequest(url: url)
                let session = URLSession.shared
                session.dataTask(with: request) { (data, response, error) in if error == nil, let data = data, let response = response as? HTTPURLResponse {
                    let jsonString = String(data: data, encoding: String.Encoding.utf8) ?? ""
                    print(jsonString)
                    }
                    }.resume()
            }) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
            }

        }
    }
}

struct _input_post_Previews: PreviewProvider {
    static var previews: some View {
        _input_post()
    }
}
