//
//  ContentView.swift
//  save_data_local
//
//  Created by raiu on 2019/11/08.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let directory_path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
    let file_Name = "my_info.txt"
    let params = Test(
        foo: "bar",
        baz: ABX(
            a: 1,
            b: 2,
            x: 3
        )
    )
        
        
    
    var body: some View {
        Button(action: {
                let encoder = JSONEncoder()
                let data = try! encoder.encode(self.params)
                print(data)

                let decoder = JSONDecoder()
                let dec_data = try! decoder.decode(Test.self, from: data)
            print(dec_data.foo)
            }) {
            Text("Save")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// for json struct

struct Test: Codable {
    var foo: String
    var baz: ABX
}

struct ABX: Codable {
    var a: Int
    var b: Int
    var x: Int
}
