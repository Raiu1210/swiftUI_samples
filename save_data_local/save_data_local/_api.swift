//
//  _api.swift
//  save_data_local
//
//  Created by raiu on 2019/11/11.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import Foundation

class API {
    let urlString = "http://192.168.11.17:3000"

    let encoder = JSONEncoder()
    let decoder = JSONDecoder()

    
    func login(user: User) {
        print(user)
        
        let destination = urlString + "/registration"
        let url = URL(string: destination)!
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print(url)
        
        do {
            let post_obj = try! encoder.encode(user)
            request.httpBody = post_obj
            let task:URLSessionDataTask = session.dataTask(with: request, completionHandler: {(data,response,error) -> Void in
                let resultData = String(data: data!, encoding: .utf8)!
                print("result:\(resultData)")
                print("response:\(response)")
            })
            task.resume()
        } catch {
            print("Error:\(error)")
            return
        }

    }
    
}
