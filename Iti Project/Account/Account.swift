//
//  model.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 28/09/21.
//

import Foundation

class Account {
    
    private(set) var bankAgency: Int
    private(set) var accNumber: Int
    private var balance: Double = 0.0
    
    
    init() {
        self.bankAgency = Int.random(in: 100...999)
        self.accNumber = Int.random(in: 1000...9999)
    }
    
    
    func deposit(of value: Double){
        if value > 0.0 {
            balance += value
        }
    }
    
    func currentBalance() -> Double {
        return balance
    }
    
    
    func withdraw(the value: Double) {
        if value <= balance {
            balance -= value
        }
    }
}
