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
    let user1 = User(fullName: "Ana Carolina", idDocument: "50170094006", phoneNumber: "32293400", address: "Rio Preto", occupation: "Dev", income: 3500.0, password: "123", account: Account())


    let user2 = User(fullName: "Leandro Oliveira", idDocument: "71434393046", phoneNumber: "98745632", address: "Rio Preto", occupation: "Dev", income: 4500, password: "321", account: Account())


    _ = UserDatabase.shared.save(user: user1)
    _ = UserDatabase.shared.save(user: user2)
    
    print("Carol agencia: ", user1.account.bankAgency)
    print("Carol conta: ", user1.account.accNumber)

    print("Leandro agencia: ", user2.account.bankAgency)
    print("Leandro conta: ", user2.account.accNumber)

}
