//
//  AccountDashboard.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 05/10/21.
//

import Foundation

struct AccountViewController {
    
    
    func startingAccountView(logeduser: User){
        
        var repeatingAccountView = true
        
        while repeatingAccountView {
            routeToAccountView().menuView()
            guard let inputOption = readLine() else { return }
            let option: AccountOptions = AccountOptions(rawValue: inputOption) ?? .notfound
            
            switch option {
            case .balance:
                routeToAccountService().newBalance(usertest: logeduser)        //saldo
            
            case .deposit:
                routeToAccountService().newDeposit(userTest: logeduser)        //depósito
            
            case .payment: break
                
            case .transference:
                routeToAccountService().newTransference(userTransference: logeduser)    //tranferencia
            
            case .pix: break
                
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

