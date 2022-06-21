//
//  ResultViewModel.swift
//  Cupcake
//
//  Created by Ibukunoluwa Soyebo on 21/06/2022.
//

import Foundation

final class ResultViewModel{
    
    var results = [Result]()
    
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
