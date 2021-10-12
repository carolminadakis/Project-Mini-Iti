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
    
    func save(user: User?) -> Bool {
        guard let userUnwrapped = user else { return false }
        UserDatabase.shared.users.append(userUnwrapped)
        
        for user in UserDatabase.shared.users.indices {
            if UserDatabase.shared.users[user].idDocument == userUnwrapped.idDocument {
                return true
            }
        }
        return false
    }
    
    func delete(user: User?) -> Bool? {
        guard let userUnwrapped = user else { return false }
        
        for user in UserDatabase.shared.users.indices {
            if UserDatabase.shared.users[user].idDocument == userUnwrapped.idDocument {
                UserDatabase.shared.users.remove(at: user)
                return true
            }
        }
        return false
    }
    
    func findByDocument(number document: String?) -> Bool {
        guard let documentUnwrapped = document else { return false }
        
        for user in UserDatabase.shared.users.indices {
            if (UserDatabase.shared.users[user].idDocument == documentUnwrapped) {
                return true
            }
        }
        return false
    }
    
    
    func validAgency(agency: Int?) -> Bool {
        guard let agencyUnwrapped = agency else { return false }
        for user in UserDatabase.shared.users.indices {
            if UserDatabase.shared.users[user].account.bankAgency == agencyUnwrapped {
                return true
            }
        }
        return false
    }
    
    func validAccount(acc: Int?) -> Bool {
        guard let accUnwrapped = acc else { return false }
        for user in UserDatabase.shared.users.indices {
            if UserDatabase.shared.users[user].account.accNumber == accUnwrapped {
                return true
            }
        }
        return false
    }
    
    func saveDeposit(of value: Double?, userDB: User) {
        guard let valueUnwrapped = value else { return }
        for user in UserDatabase.shared.users.indices {
            if (userDB.password ==  UserDatabase.shared.users[user].password) {
                UserDatabase.shared.users[user].account.deposit(of: valueUnwrapped)
            }
        }
    }
    func getBalance(loged user: User) {
        let userPass = user.password
        
        for user in UserDatabase.shared.users.indices {
            if (UserDatabase.shared.users[user].password == userPass) {
                let balance = UserDatabase.shared.users[user].account.currentBalance()
                print(balance)
            }
        }
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
    
    func payWithPix(keyType: PixKey, key: String, of value: Double?, loged: User) -> Bool{
        guard let value = value else { return false}
        
        let result = existsPixKey(inputKey: key) //checa se existe o pix informado
        
        let total = loged.account.currentBalance() //checa o saldo da conta do cliente logado
        
        for userDB in UserDatabase.shared.users.indices {
            if (total >= value) {
                UserDatabase.shared.users[userDB].account.withdraw(the: value)
            }
        }
        
        if result == true {
            let userReceiver = UserDatabase.shared.users.first(where: {$0.account.pixKeys.contains(where: {$0.key == key})})
            userReceiver?.account.deposit(of: value)
        }
        return true
    }
    
    func addPixKey(pixKey: Pix, loged: User) -> Bool {
        for user in UserDatabase.shared.users.indices {
            if (UserDatabase.shared.users[user].idDocument == loged.idDocument) {
                UserDatabase.shared.users[user].account.pixKeys.append(pixKey)
                return true
            }
            
        }
        return false
    }
    
    
    func transference(to agencyInput: Int?, to accountInput: Int?, of inputValue: Double?, userDB: User) -> Bool{
        guard let agency = agencyInput else { return false}
        guard let account = accountInput else { return false}
        guard let value = inputValue else { return false}
        
        for userSender in UserDatabase.shared.users.indices {
            if (userDB.password == UserDatabase.shared.users[userSender].password) {
                UserDatabase.shared.users[userSender].account.withdraw(the: value)
            }
        }
        
        for userPaid in UserDatabase.shared.users.indices {
            if (agency == UserDatabase.shared.users[userPaid].account.bankAgency && account == UserDatabase.shared.users[userPaid].account.accNumber) {
                UserDatabase.shared.users[userPaid].account.deposit(of: value)
                return true
            }
            
        }
        return false
    }
    
    func withdrawTest(of valueInput: Double?, userDB: User) {
        guard let value = valueInput else { return }
        for user in UserDatabase.shared.users.indices {
            if (userDB.password == UserDatabase.shared.users[user].password) {
                UserDatabase.shared.users[user].account.withdraw(the: value)
            }
        }
    }
    
    func validPassword(passwordInput: String?) -> String {
        guard let passwordUnwrapped = passwordInput else { return "" }
        for user in UserDatabase.shared.users.indices {
            if (UserDatabase.shared.users[user].password == passwordUnwrapped) {
                
                return UserDatabase.shared.users[user].password
            }
        }
        return ""
    }
}
