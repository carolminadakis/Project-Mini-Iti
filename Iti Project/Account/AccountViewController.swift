//
//  AccountDashboard.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 05/10/21.
//

import Foundation

struct AccountViewController {
    
    
    func startingAccountView() {
        
        var repeatingAccountView = true
        
        while repeatingAccountView {
            routeToAccountView().menuView()
            guard let inputOption = readLine() else { return }
            let option: AccountOptions = AccountOptions(rawValue: inputOption) ?? .notfound
            
            switch option {
            case .balance:
                routeToAccountService().newBalance()
                
            case .deposit:
                routeToAccountService().newDeposit()
                
            case .payment: break
                
            case .transference: break
                
            case .pix: break
                
            case .logout:
                repeatingAccountView = false
                routeToGenericView().logout()
                routeToMainViewController().initMainView()
            case .notfound:
                routeToGenericView().invalidOption()
                repeatingAccountView = true             
            }
        }
    }
}

