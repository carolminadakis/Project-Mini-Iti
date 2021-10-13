//
//  controller.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 29/09/21.
//

import Foundation

struct UserAccountController {
    
    func formToRegisterNewUser() -> User{
        var name: String = ""
        var document: String = ""
        var phoneNumber: String = ""
        var address: String = ""
        var occupation: String = ""
        var income: Double = 0.0
        var password: String = ""
        
        routeToGenericView().header()
        routeToGenericView().getName()
        if let inputName = readLine() {
            name = inputName
        }
        
        routeToGenericView().getDocument()
        if let inputDocument = readLine(){
            document = inputDocument
        }
        routeToGenericView().getCellPhoneNumber()
        if let inputPhone = readLine(){
            phoneNumber = inputPhone
        }
        routeToGenericView().getAddress()
        if let inputAddress = readLine(){
            address = inputAddress
        }
        routeToGenericView().getOccupation()
        if let inputOccupation = readLine(){
            occupation = inputOccupation
        }
        routeToGenericView().getIncome()
        if let inputIncome = readLine(){
            income = Double(inputIncome) ?? 0.0
        }
        routeToGenericView().getPassword()
        if let inputPassword = readLine() {
            password = inputPassword
        }
        let newUser: User = User(fullName: name, idDocument: document, phoneNumber: phoneNumber, address: address, occupation: occupation, income: income, password: password, account: Account())
        return newUser
    }
    
    func validation(of newUser: User){
        if (newUser.fullName.isNameValid() && newUser.idDocument.isCPFValid()){
            let isSuccess = UserDatabase.shared.save(user: newUser)
            if isSuccess == true {
                routeToGenericView().successOperation()
                print("Agencia: ", newUser.account.bankAgency)
                print("Conta corrente: ", newUser.account.accNumber)
            }
        } else {
            routeToGenericView().failedOperation()
        }
    }
    
    func deleteUserAccount(logedUser: User){
        
        routeToGenericView().getDocument()
        guard let document = readLine() else { return }
        
        routeToGenericView().getPassword()
        guard let password = readLine() else { return }
        
        guard let index = UserDatabase.shared.users.firstIndex(where: {$0.idDocument == document && $0.password == password}) else { return }
        UserDatabase.shared.delete(user: index)
        
    }
}

