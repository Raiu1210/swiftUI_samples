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
                session.dataTask(with: request) {
                    (data, response, error) in if error == nil, let data = data, let _ = response as? HTTPURLResponse {
                        let jsonString = String(data: data, encoding: String.Encoding.utf8) ?? ""
                        print(jsonString)
                        }
                    }.resume()
            }) {
                Text("GET method")
            }
                .frame(width: 200.0, height: 50.0)
            
            
            Button(action: {
//                let param = [
//                    "firstName" : "Hello",
//                    "lastName"  : "World",
//                    "userId"    : "7"
//                ]
                
                let urlString = "http://192.168.3.7:3000/registration"
                let url = URL(string: urlString)!
                let request = NSMutableURLRequest(url: url)
                print("URL : \(url)")
                
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                let params:[String:Any] = [
                    "foo": "bar",
                    "baz":[
                        "a": 1,
                        "b": 2,
                        "x": 3]
                ]
                do{
                    request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)

                    let task:URLSessionDataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data,response,error) -> Void in
                        let resultData = String(data: data!, encoding: .utf8)!
                        print("result:\(resultData)")
                        print("response:\(response)")

                    })
                    task.resume()
                }catch{
                    print("Error:\(error)")
                    return
                }
                
            }) {
                Text("POST method")
            }
                .frame(width: 200.0, height: 50.0)
            
            

        }
    }
}

struct _input_post_Previews: PreviewProvider {
    static var previews: some View {
        _input_post()
    }
}



