//
//  AccountController.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 06/10/21.
//

import Foundation

class AccountService{
    
    func newDeposit() {
        routeToGenericView().getValue()
        guard let inputValue = readLine() else { return }
        guard let value = Double(inputValue) else { return  }
        if value > 0.0 {
            for user in Database.shared.users.indices {
                Database.shared.users[user].account.deposit(of: value)
                print("Depósito realizado com sucesso.")
            }
        }
    }
    
    
    func newBalance(){
        for user in Database.shared.users.indices {
            let balanceValue = Database.shared.users[user].account.currentBalance()
            print(balanceValue)
        }
    }
    
    func newTransference(password: String?) {
        routeToGenericView().getValue()
        guard let userPassword = password else { return }
        
        //routeToUser()
    }
    
    //recebe as informações do usuário e apresenta a view do cliente
    func validateToLogin() -> Bool{
        var pass = ""
        var doc = ""
        
        routeToGenericView().getDocument()
        if let cpf = readLine() {
            doc = cpf
        }
        
        routeToGenericView().getPassword()
        if let password = readLine() {
            pass = password
        }
        guard let user = Database.shared.findByDocument(document: doc) else {
            return false }
        if user.password == pass {
            //routeToAccountView()
        }
        return true
    }
    
    
    func routeToAccount() -> Account {
        let transaction = Account()
        return transaction
        
    }
}
