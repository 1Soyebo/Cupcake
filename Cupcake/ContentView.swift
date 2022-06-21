//
//  ContentView.swift
//  Cupcake
//
//  Created by Ibukunoluwa Soyebo on 21/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    
    @State private var results = [Result]()

    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                }

                Section {
                    Button("Create account") {
                        print("Creating account…")
                    }
                }
                .disabled(username.isEmpty || email.isEmpty)

            }
            .navigationTitle("Sign Up")
        }
        
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
