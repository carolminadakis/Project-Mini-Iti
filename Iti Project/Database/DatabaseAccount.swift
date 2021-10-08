//
//  DatabaseAccount.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 05/10/21.
//

import Foundation

class Database {
    
    private(set) var users: [User] = []
    
    
    static var shared: Database = {
        var instance = Database()
        return instance
    }()
    
    private init() {}
    
    func initData() {
        let clients = [User]()
        Database.shared.users = clients
    }
    
    func save(user: User?) -> Bool {
        guard let userUnwrapped = user else { return false }
        Database.shared.users.append(userUnwrapped)
        
        for user in Database.shared.users.indices {
            if Database.shared.users[user].idDocument == userUnwrapped.idDocument {
                return true
            }
        }
        return true
    }
    
    func delete(user: User?) -> Bool? {
        guard let userUnwrapped = user else { return false }
        
        for user in Database.shared.users.indices {
            if Database.shared.users[user].idDocument == userUnwrapped.idDocument {
                Database.shared.users.remove(at: user)
                return true
            }
        }
        return false
    }
    
    func findByDocument(document: String?) -> User? {
        guard let documentUnwrapped = document else { return nil }
        
        for user in Database.shared.users.indices {
            if Database.shared.users[user].idDocument == documentUnwrapped {
                return Database.shared.users[user]
            }
        }
        return nil
    }
    
    
    func validAgency(agency: Int?) -> Bool {
        guard let agencyUnwrapped = agency else { return false }
        for user in Database.shared.users.indices {
            if Database.shared.users[user].account.bankAgency == agencyUnwrapped {
                return true
            }
        }
        return false
    }
    
    func validAccount(acc: Int?) -> Bool {
        guard let accUnwrapped = acc else { return false }
        for user in Database.shared.users.indices {
            if Database.shared.users[user].account.accNumber == accUnwrapped {
                return true
            }
        }
        return false
    }
    
    func saveDeposit(value: Double?) {
        guard let valueUnwrapped = value else { return }
        for user in Database.shared.users.indices {
            Database.shared.users[user].account.deposit(of: valueUnwrapped)
        }
    }
    func getBalance() {
        for user in Database.shared.users.indices {
            let balance = Database.shared.users[user].account.currentBalance()
          print(balance)
        }
    }
    
    func transference(of inputValue: Double?) {
        guard let value = inputValue else { return }
        for user in Database.shared.users.indices {
            Database.shared.users[user].account.transference(of: value)
        }
    }
}

//    func validUser(document: String?, password: String?) -> Bool {
//        guard let docUnwrapped = document else { return false }
//        guard let passUnwrapped = password else { return false }
//        for user in Database.shared.users.indices {
//            if (Database.shared.users[user].idDocument != docUnwrapped && Database.shared.users[user].password != passUnwrapped) {
//                return false
//            }
//        }
//        return true
//    }
//
//REVISAR DAQUI
//    func getReport(document: String?) -> User? {
//        guard document != nil else { return nil }
//        for user in Database.shared.users.indices {
//            print("Conta corrente: ", Database.shared.users[user].account.accNumber)
//            print("Nome completo: ", Database.shared.users[user].fullName)
//            print("CPF: ", Database.shared.users[user].idDocument)
//            print("Agencia: ", Database.shared.users[user].account.bankAgency)
//        }
//        return nil
//    }

//    func getReport(document: String?) -> (String?, String?, Int?, Int?) {
//       guard docUnwrapped = document else { return nil; nil; nil; nil}
//        for user in Database.shared.users.indices {
//            let fullName = Database.shared.users[user].fullName
//            let cpf = Database.shared.users[user].idDocument
//            let agency = Database.shared.users[user].account.bankAgency
//            let account = Database.shared.users[user].account.accNumber
//            return (fullName, cpf, agency, account)
//        }
//



