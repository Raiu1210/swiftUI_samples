//
//  _input_field.swift
//  save_data_local
//
//  Created by raiu on 2019/11/08.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI


struct _input_field: View {
    let directory_path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
    let file_Name = "my_info.txt"
    let file_path = ""
    
    @State var user_name: String = ""
    @State var password: String = ""
    @State var input_check: Bool = false
    
    let params = Test(
        foo: "bar",
        baz: ABX(
            a: 1,
            b: 2,
            x: 3
        )
    )
    
    
    var body: some View {
        VStack {
            TextField("Username", text: $user_name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .border(Color.black, width: 1)
            
            TextField("Password", text: $password)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .border(Color.black, width: 1)
            
            Button(
                action: {
                    self.check_input()
                    self.post_data()
                }) {
                Text("Save")
            }.alert(isPresented: $input_check) {
                Alert(title: Text("Input is wrong"))
            }
        }
    }
    
    
    
    func check_input() {
        if user_name == "" {
            input_check = true
        }
        if password == "" {
            input_check = true
        }
    }
    
    func post_data() {
        if input_check {
            print("aborted")
            return
        }
        
        let user = User(user_name: user_name, password: password)
        let api = API()
        api.login(user: user)
    }
    
    func test() {
        let encoder = JSONEncoder()
        let data = try! encoder.encode(self.params)
        let jsonstr:String = String(data: data, encoding: .utf8)!
        print(jsonstr)

        let d_data = try! encoder.encode(jsonstr)
        print(d_data)
        
        let decoder = JSONDecoder()

        do {
            let decoded: Test = try decoder.decode(Test.self, from: jsonstr.data(using: .utf8)!)
            print(decoded)
            print(decoded.baz.a)
        } catch {
            print(error.localizedDescription)
        }
        print(self.user_name)
        print(self.password)
    }
}

struct _input_field_Previews: PreviewProvider {
    static var previews: some View {
        _input_field()
    }
}


struct User : Codable {
    var user_name : String
    var password : String
}

struct Test: Codable {
    var foo: String
    var baz: ABX
}

struct ABX: Codable {
    var a: Int
    var b: Int
    var x: Int
}
