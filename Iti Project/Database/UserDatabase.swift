//
//  DatabaseAccount.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 05/10/21.
//

import Foundation

class UserDatabase {
    
    private(set) var users: [User] = []
    
    
    static var shared: UserDatabase = {
        var instance = UserDatabase()
        return instance
    }()
    
    private init() {}
    
    func initData() {
        let user = [User]()
        UserDatabase.shared.users = user
    }
    
    func save(user: User) -> Bool {
        UserDatabase.shared.users.append(user)
        return findByDocument(number: user.idDocument)
    }
    
    func delete(user: Int){
        users.remove(at: user)
    }
    
    func findByDocument(number document: String) -> Bool {
        
        if users.contains(where: {$0.idDocument == document}) { //retorna um booleano da busca pelo documento no array
            return true
        }
        return false
    }
    
    func isValidAgencyAndAccount(agency: Int, account: Int) -> Bool {
        if users.contains(where: {$0.account.bankAgency == agency && $0.account.accNumber == account}) {
            return true
        }
        return false
    }
    
    func saveDeposit(of value: Double?, userDB: User) -> Bool{
        guard let valueUnwrapped = value else { return false}
        
        //o firstIndex devolve a posição do primeiro elemento encontrado no array que satisfaça a condição da busca no where
        guard let index = users.firstIndex(where: {$0.password == userDB.password}) else { return false }
        UserDatabase.shared.users[index].account.deposit(of: valueUnwrapped)
        return true
    }
    
    func getBalance(loged user: User) {
        
        guard let index = users.firstIndex(where: {$0.password == user.password}) else { return }
        let result = users[index].account.currentBalance()
        print(result)
    }
    
    func existsPixKey(inputKey : String ) -> Bool {
        return UserDatabase.shared.users.flatMap({ $0.account.pixKeys }).contains(where: { $0.key == inputKey})
    }
    
    func validadePixKey(keyType: PixKey, key: String) -> Bool {
        var result = true
        
        if (keyType == .email) {
            result = key.isEmailValid()
        }
        if (keyType == .document) {
            result = key.isCPFValid()
        }
        if keyType == .phone {
            result = key.isPhoneValid()
        }
        return result
    }
    
    func payWithPix(keyType: PixKey, key: String, of valueInput: Double?, loged: User) -> Bool{
        guard let value = valueInput else { return false}
        let result = existsPixKey(inputKey: key) //checa se existe o pix informado
        
        for userDB in users.indices {
            let total = users[userDB].account.currentBalance()
            if (total >= value) {
                UserDatabase.shared.users[userDB].account.withdraw(the: value)
                if (result == true) {
                    let userReceiver = UserDatabase.shared.users.first(where: {$0.account.pixKeys.contains(where: {$0.key == key})})
                    guard let user2 = userReceiver else { return false }
                    user2.account.deposit(of: value)
                }
            }
        }
        return true
    }
    
    func addPixKey(pixKey: Pix, loged: User) -> Bool {

        if findByDocument(number: loged.idDocument) {
            guard let index = users.firstIndex(where: {$0.idDocument == loged.idDocument}) else {return false}
            users[index].account.pixKeys.append(pixKey)
            return true
        } else {
            return false
        }
    }
    
    func transference(to agency: Int, to account: Int, of value: Double, userDB: User) -> Bool{
        
        if validUser(document: userDB.idDocument, password: userDB.password) {
            guard let user = users.firstIndex(where: {$0.idDocument == userDB.idDocument}) else { return false}
            users[user].account.withdraw(the: value)
        }
        guard let test = users.firstIndex(where: {$0.account.bankAgency == agency && $0.account.accNumber == account}) else { return false }
        users[test].account.deposit(of: value)
        return true
    }
    
    func validUser(document: String, password: String) -> Bool {
        if users.contains(where: {$0.idDocument == document && $0.password == password}) {
            return true
        }
        return false
    }
}
