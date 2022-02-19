//
//  JsonRequest.swift
//  SimpleGetRequest
//
//  Created by ak77m on 18.02.2022.
//

import Foundation

final class JsonRequest {
    
    func standartRequest (_ url: String, _ completion: @escaping ([JsonStruct]) -> () )  {
        guard let url = URL(string: url) else {
            return
        }
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                do {
                    if let newData = data {
                        var decodedData = try JSONDecoder().decode([JsonStruct].self, from: newData)
                        decodedData.indices.forEach { decodedData[$0].date = Date() }
                        
                         DispatchQueue.main.async {
                            completion(decodedData)
                            
                        }
                    } else {
                        print("No data")
                    }
                } catch {
                    print("Error \(error)")
                }
            }.resume()
        }
}
