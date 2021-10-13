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

func routeToUserAccountController() -> UserAccountController {
    let userController = UserAccountController()
    return userController
}

func routeToAccountViewController() -> AccountViewController{
    let accountController = AccountViewController()
    return accountController
}

func routeToPixController() -> PixController{
    let pixController = PixController()
    return pixController
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

func routeToAccount() -> Account {
    let transaction = Account()
    return transaction
}

func routeToPixView() -> PixView {
    let pixView = PixView()
    return pixView
}
