//
//  PixController.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 11/10/21.
//

import Foundation

struct PixController {
    
    func startPixView(to logedUser: User) {
        var repeatView = true
        
        while repeatView {
            routeToPixView().pixInitialMenu()
            guard let inputOption = readLine() else { return }
            let option: PixMenu = PixMenu(rawValue: inputOption) ?? .notfound
            
            switch option {
            case .register:
                registerPixKey(logedUser: logedUser)
            case .payment:
                payWithPix(logeduser: logedUser)
            case .returnMenu:
                routeToAccountViewController().startingAccountView(to: logedUser)
                repeatView = false
            case .notfound:
                routeToGenericView().invalidOption()
            }
        }
    }
    
    func registerPixKey(logedUser: User){
        let result = isPixValid()
        if result.2 == true {
            let pixKey = Pix(type: result.0, key: result.1)
            let resultDB = UserDatabase.shared.addPixKey(pixKey: pixKey, loged: logedUser)
            if resultDB == true {
                print("Chave cadastrada com sucesso")
            }
        } else {
            print("Informação incorreta")
        }
        
    }
    
    func isPixValid() -> (PixKey, String, Bool) {
        var repeatMenu = true
        var keyType: PixKey = .notfound
        var key = ""
        
        while repeatMenu {
            routeToPixView().pixViewMenu()
            routeToGenericView().getPixKey()
            if let inputOption = readLine() {
                let inputUnwrapped: PixKey = PixKey(rawValue: inputOption) ?? .notfound
                keyType = inputUnwrapped
                if (keyType == .email || keyType == .document || keyType == .phone) {
                    repeatMenu = false
                }
                if (keyType == .returnMenu || keyType == .notfound) {
                    repeatMenu = false
                    routeToPixView().pixInitialMenu()
                    }
                }
            }
        
        
        routeToGenericView().getPixKey()
        if let inputKey = readLine() {
            key = inputKey
        }
        
        let resultTest = UserDatabase.shared.validadePixKey(keyType: keyType, key: key)
        return (keyType, key, resultTest)
    }
    
    
    func payWithPix(logeduser: User) {
        var value: Double?
        
        let pixInformation = isPixValid()
        let keyType = pixInformation.0      //pixInformation.0 me traz o tipo da chave
        let key = pixInformation.1      //pixInformation.1 me traz a chave pix
        let pixValidationResult = pixInformation.2 //recebo o valor booleano do método isPixValid
        
        if (pixValidationResult == true) {
            routeToGenericView().getValue()
            guard let inputValue = readLine() else { return }
            value = Double(inputValue)
            
            if (UserDatabase.shared.existsPixKey(inputKey: key)){
                let result = UserDatabase.shared.payWithPix(keyType: keyType, key: key, of: value, loged: logeduser)
                if result == true {
                    print("Operação realizada com sucesso")
                } else {
                    print("Chave informada inexistente")
                }
            }
        }
    }
}
