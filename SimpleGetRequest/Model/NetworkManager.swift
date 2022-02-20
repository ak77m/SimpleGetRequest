//
//  NetworkManager.swift
//  SimpleGetRequest
//
//  Created by ak77m on 18.02.2022.
//

import Foundation
import UIKit

final class RequestManager {
   
    static let shared = RequestManager()
    private let jsonRequest = JsonRequest()
    
    let url = "https://jsonplaceholder.typicode.com/photos"
    var myData = UserDefaults.standard.structArrayData(JsonStruct.self, forKey: "cache")  
    
    func standardRequest ()  {
        jsonRequest.standartRequest(url) { array in
            if !array.isEmpty {
                self.myData = array
                UserDefaults.standard.setStructArray(self.myData, forKey: "cache")
            }
        }
    }
}
