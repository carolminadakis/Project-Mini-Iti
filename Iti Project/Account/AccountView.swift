//
//  AccountView.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 06/10/21.
//

import Foundation

struct AccountView {
    
    
    func menuView() {
        print("""
    ****************************************
    *               Mini ITI               *
    ****************************************
    *                                      *
    *       Digite a opção que deseja:     *
    *                                      *
    *       [1] - Saldo                    *
    *       [2] - Depositar                *
    *       [3] - Excluir Conta            *
    *       [4] - Transferência            *
    *       [5] - Pix                      *
    *       [6] - Sair                     *
    *                                      *
    ****************************************
    
    """)
    }
    
    func getUser() -> User{
        var password = ""
        var document = ""
        
        routeToGenericView().getDocument()
        if let cpf = readLine() {
            document = cpf
        }
        
        routeToGenericView().getPassword()
        if let pass = readLine() {
            password = pass
        }
        
        _ = UserDatabase.shared.findByDocument(number: document)
        _ = UserDatabase.shared.validPassword(passwordInput: password)
        
        return User(idDocument: document, password: password)
    }
    
}

enum AccountOptions: String {
    case balance = "1"
    case deposit = "2"
    case delete = "3"
    case transference = "4"
    case pix = "5"
    case logout = "6"
    case notfound = "0"
}
