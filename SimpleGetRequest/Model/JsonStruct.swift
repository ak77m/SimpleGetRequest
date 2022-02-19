//
//  JsonStruct.swift
//  SimpleGetRequest
//
//  Created by ak77m on 18.02.2022.
//

import Foundation

struct JsonStruct : Codable, Hashable {
    let albumId : Int
    let id : Int
    let title : String
    let url : String
    var date: Date? = Date()
}
