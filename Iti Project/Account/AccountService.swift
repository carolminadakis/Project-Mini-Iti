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
        
        if UserDatabase.shared.saveDeposit(of: value, userDB: logedUser) {
            routeToGenericView().successOperation()
        }
    }
    
    func newBalance(to LogedUser: User){
        UserDatabase.shared.getBalance(loged: LogedUser)
    }
    
    func newTransference(from logedUser: User) {
        var value = 0.0
        
        //1- Agencia
        routeToGenericView().getAgency()
        guard let inputAgency = readLine() else { return }
        guard let agency = Int(inputAgency) else { return  }
        //1- Conta
        routeToGenericView().getAccount()
        guard let inputAccount = readLine() else { return }
        guard let account = Int(inputAccount) else { return  }
        
        //2- Valida Agencia e Conta
        if UserDatabase.shared.isValidAgencyAndAccount(agency: agency, account: account) {
            
            //3- Recebe valor
            routeToGenericView().getValue()
            guard let inputValue = readLine() else { return }
            value = Double(inputValue) ?? 0.0
            
        } //Tranfere valor
        let result = UserDatabase.shared.transference(to: agency, to: account, of: value, userDB: logedUser)
        if(result == true) {
            routeToGenericView().successOperation()
        } else {
            routeToGenericView().failedOperation()
        }
    }
    
    //Valido o user e passo ele validado como argumento para o acesso do menu do cliente 
    func getIntoAccount(validate userInfo: User) {
        
        if UserDatabase.shared.users.contains(where: {$0.idDocument == userInfo.idDocument}) {
            let user = User(idDocument: userInfo.idDocument, password: userInfo.password)
            routeToAccountViewController().startingAccountView(to: user)
        }
    }
}

