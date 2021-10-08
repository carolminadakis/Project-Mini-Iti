//
//  Routes.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 08/10/21.
//

import Foundation

func routeToStartingMainView() {
    let firstView = MainView()
    firstView.startingMainView()
}

func routeToAccountView() -> AccountView{
    let view = AccountView()
    return view
}

func routeToRegisterController() -> RegisterController {
    let access = RegisterController()
    return access
}

func routeToAccountViewController() -> AccountViewController{
    let accountController = AccountViewController()
    return accountController
}


func routeToGenericView() -> GenericView{
    let label = GenericView()
    return label
}

func routeToAccountService() -> AccountService {
    let accountView = AccountService()
    return accountView
}

func routeToMainViewController() -> MainViewController {
    let viewController = MainViewController()
    return viewController
}

