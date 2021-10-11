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
                let user = routeToRegisterController().formToRegisterNewUser()  //preenche formulário de registro
                routeToRegisterController().validation(of: user)                //valida informações
                routeToAccountService().getIntoAccount(valid: user)             //valida acesso e entra no menu da conta
                repeatMainView = false
            case .login:
                let logedUser = routeToAccountView().getUser()                  //chama a view de acesso e recebe informações do usuário
                routeToAccountService().getIntoAccount(valid: logedUser )       //valida acesso e entra no menu da conta
                repeatMainView = false
            case .logout:
                routeToGenericView().logout()                                   //finaliza app
                repeatMainView = false
                break
            case .notFound:
                routeToGenericView().invalidOption()
            }
        }
    }
}

