//
//  Pix.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 11/10/21.
//

import Foundation

class Pix{
    var type: PixKey
    var key = ""
    
    init(type: PixKey, key: String) {
        self.type = type
        self.key = key
    }
}

enum PixKey: String {
    case email = "1"
    case phone = "2"
    case document = "3"
    case returnMenu = "5"
    case notfound = "0"
}
