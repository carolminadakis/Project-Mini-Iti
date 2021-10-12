//
//  main.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 27/09/21.
//

import Foundation

populaBanco()

 MainViewController().initMainView()

func populaBanco() {
    let user1 = User(fullName: "Maria da Silva", idDocument: "67916421062", phoneNumber: "32293400", address: "São Paulo", occupation: "Enfermeira", income: 3500.0, password: "123", account: Account())


    let user2 = User(fullName: "João de Oliveira", idDocument: "20205978029", phoneNumber: "98745632", address: "Curitiba", occupation: "Mecânico", income: 4500, password: "321", account: Account())


    _ = UserDatabase.shared.save(user: user1)
    _ = UserDatabase.shared.save(user: user2)
    
    print("Maria agencia: ", user1.account.bankAgency)
    print("Maria conta: ", user1.account.accNumber)

    print("João agencia: ", user2.account.bankAgency)
    print("João conta: ", user2.account.accNumber)

}
