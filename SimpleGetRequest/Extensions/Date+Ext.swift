//
//  Date+Ext.swift
//  SimpleGetRequest
//
//  Created by ak77m on 18.02.2022.
//

import Foundation
import UIKit

extension Date {
    
    func formattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: self)
    }
    
}


extension UIImageView {

    func fetchImage(_ url: String) {
        
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let httpUrlResponse = response as? HTTPURLResponse, httpUrlResponse.statusCode == 200,
                      let data = data, error == nil,
                      let image = UIImage(data: data)
                else { return }
                 DispatchQueue.main.async () {
                     self.image = image
                }
            }
            .resume()
    }
}
