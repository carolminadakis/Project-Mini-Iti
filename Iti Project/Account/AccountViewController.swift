//
//  AccountDashboard.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 05/10/21.
//

import Foundation

struct AccountViewController {
    
    
    func startingAccountView(to logedUser: User){
        
        var repeatingAccountView = true
        
        while repeatingAccountView {
            routeToAccountView().menuView()
            guard let inputOption = readLine() else { return }
            let option: AccountOptions = AccountOptions(rawValue: inputOption) ?? .notfound
            
            switch option {
            case .balance:
                routeToAccountService().newBalance(to: logedUser)        //saldo
            
            case .deposit:
                routeToAccountService().newDeposit(to: logedUser)        //depósito
            
            case .delete: break
                
            case .transference:
                routeToAccountService().newTransference(from: logedUser)    //tranferencia
            
            case .pix:
                routeToPixController().startPixView(to: logedUser)
                repeatingAccountView = false
            case .logout:
                routeToGenericView().logout()       //finaliza menu da conta e volta para menu inicial
                repeatingAccountView = false
                routeToMainViewController().initMainView()
            case .notfound:
                routeToGenericView().invalidOption()
                repeatingAccountView = true             
            }
        }
    }
}

