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
    let APSD_path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]

    let encoder = JSONEncoder()
    let decoder = JSONDecoder()

    
    func login(user: User) {
        print(user)
        
        // post
//        let destination = urlString + "/registration"
//        let url = URL(string: destination)!
//        var request = URLRequest(url: url)
//        let session = URLSession.shared
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        do {
//            let post_obj = try! encoder.encode(user)
//            request.httpBody = post_obj
//            let task:URLSessionDataTask = session.dataTask(with: request, completionHandler: {(data,response,error) -> Void in
//                let resultData = String(data: data!, encoding: .utf8)!
//                print("result:\(resultData)")
//                print("response:\(response)")
//            })
//            task.resume()
//        } catch {
//            print("Error:\(error)")
//            return
//        }
//
        
        do {
            let file_path = APSD_path + "/user_info.txt"
            let user_info = try! encoder.encode(user)
            let user_info_str:String = String(data: user_info, encoding: .utf8)!
            try user_info_str.write(toFile: file_path, atomically: false, encoding: String.Encoding.utf8)
            print("Success")
            
            print("Inside file is here")
            let file_url = NSURL(fileURLWithPath: file_path)
            let jsonString = try String(contentsOf: file_url as URL, encoding: String.Encoding.utf8)
            print(jsonString)
        } catch {
            print("Error:\(error)")
            return
        }
        

    }
    
}
