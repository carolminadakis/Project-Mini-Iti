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
    
    func transference(to agencyInput: Int?, to accountInput: Int?, of inputValue: Double?) -> Bool{
        
        
        guard let agency = agencyInput else { return false}
        guard let account = accountInput else { return false}
        guard let value = inputValue else { return false}
        
        for user in UserDatabase.shared.users.indices {
            if (agency == UserDatabase.shared.users[user].account.bankAgency && account == UserDatabase.shared.users[user].account.accNumber) {
                UserDatabase.shared.users[user].account.deposit(of: value)
                return true
            }
            
        }
        return false
    }
    
    func withdraw(of valueInput: Double?, userDB: User) {
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
