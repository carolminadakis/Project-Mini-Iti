//
//  Pix.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 11/10/21.
//

import Foundation

class Pix{
    
    var typeKey: PixKey
    var user: User
    var key: String
    
    init(typeKey: PixKey, user: User, key: String) {
        self.typeKey = typeKey
        self.user = user
        self.key = key
    }
    
}

enum PixKey: String {
    case email = "1"
    case phone = "2"
    case document = "3"
}
