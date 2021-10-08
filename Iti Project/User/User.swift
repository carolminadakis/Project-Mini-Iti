//
//  accountholder.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 28/09/21.
//

import Foundation

class User {
    
    var fullName: String
    var idDocument: String
    var phoneNumber: String
    var address: String
    var occupation: String
    var income: Double
    var password: String
   private(set) var account = Account()

    init(fullName: String, idDocument: String, phoneNumber: String, address: String, occupation: String, income: Double, password: String, account: Account) {
        self.fullName = fullName
        self.idDocument = idDocument
        self.phoneNumber = phoneNumber
        self.address = address
        self.occupation = occupation
        self.income = income
        self.password = password
        self.account = Account()
    }

}
