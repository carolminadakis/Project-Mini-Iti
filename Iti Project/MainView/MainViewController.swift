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
                let user = routeToUserAccountController().formToRegisterNewUser()  //preenche formulário de registro
                routeToUserAccountController().validation(of: user)                //valida informações
                routeToAccountService().getIntoAccount(validate: user)             //valida acesso e entra no menu da conta
                repeatMainView = false
            case .login:
                let logedUser = routeToAccountView().getUser()                  //chama a view de acesso e recebe informações do usuário
                routeToAccountService().getIntoAccount(validate: logedUser )       //valida acesso e entra no menu da conta
                repeatMainView = false
            case .logout:
                routeToGenericView().logout()                                   //finaliza app
                repeatMainView = false
            case .notFound:
                routeToGenericView().invalidOption()
            }
        }
    }
}

