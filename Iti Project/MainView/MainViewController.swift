//
//  controller.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 27/09/21.
//

import Foundation

struct MainViewController {
    
    func initMainView() {
        
        var repeatMainView = true
        
        while repeatMainView {
            routeToStartingMainView() //chamada do menu inicial
            guard let inputOption = readLine() else { return }
            let option: MainOptions = MainOptions(rawValue: inputOption) ?? .notFound
            
            switch option {
            case .register:
                let user = routeToRegisterController().formToRegisterNewUser()
                let isValid = routeToRegisterController().validation(of: user)
                routeToRegisterController().getIntoAccount(is: isValid)
                repeatMainView = false
            case .login:
                let isValid = routeToAccountService().validateToLogin()
                routeToRegisterController().getIntoAccount(is: isValid)
                repeatMainView = false
            case .logout:
                repeatMainView = false
                routeToGenericView().logout()
            case .notFound:
                routeToGenericView().invalidOption()
            }
        }
    }
}

