//
//  AccountController.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 06/10/21.
//

import Foundation

class AccountService{
    
    func newDeposit(to logedUser: User) {
        
        routeToGenericView().getValue()
        guard let inputValue = readLine() else { return }
        guard let value = Double(inputValue) else { return  }
        
        for user in UserDatabase.shared.users.indices {
            if (UserDatabase.shared.users[user].password == logedUser.password) {
                UserDatabase.shared.saveDeposit(of: value, userDB: logedUser)
            }
        }
        print("Depósito realizado com sucesso.")
    }
    
    func newBalance(to LogedUser: User){
        
        for user in UserDatabase.shared.users.indices {
            if (UserDatabase.shared.users[user].password == LogedUser.password) {
                UserDatabase.shared.getBalance(loged: LogedUser)
            }
        }
    }
    
    func newTransference(from logedUser: User) {
        var value: Double?
        /*
         1- Receber agencia e conta de destino
         2- validar agencia e conta de destino
         3- receber valor para transferência
         4- validar senha para tranferência
         5- retirar dinheiro da conta do cliente
         6- transferir para a conta de destino
         */
        
        //1- Agencia
        routeToGenericView().getAgency()
        guard let inputAgency = readLine() else { return }
        guard let agency = Int(inputAgency) else { return  }
        //1- Conta
        routeToGenericView().getAccount()
        guard let inputAccount = readLine() else { return }
        guard let account = Int(inputAccount) else { return  }
        
        //2- Valida Agencia e Conta
        let isValidAgency = UserDatabase.shared.validAgency(agency: agency)
        let isValidAccount = UserDatabase.shared.validAccount(acc: account)
        
        if (isValidAgency == true && isValidAccount == true){
            
            //3- Recebe valor
            routeToGenericView().getValue()
            guard let inputValue = readLine() else { return }
            value = Double(inputValue)
            
            UserDatabase.shared.withdraw(of: value, userDB: logedUser)
        }
        if(UserDatabase.shared.transference(to: agency, to: account, of: value) == true) {
            print("Transferência realizada com sucesso.")
        } else {
            print("Não foi possível completar a operação.")
        }
    }
    
    //Valido o user e passo ele validado como argumento para o acesso do menu do cliente 
    func getIntoAccount(validate userInfo: User) {
        for user in UserDatabase.shared.users.indices {
            if (UserDatabase.shared.users[user].idDocument == userInfo.idDocument && UserDatabase.shared.users[user].password == userInfo.password) {
                
                let user = User(idDocument: userInfo.idDocument, password: userInfo.password)
                routeToAccountViewController().startingAccountView(to: user)
            }
        }
    }
    
    func routeToAccount() -> Account {
        let transaction = Account()
        return transaction
    }
}

