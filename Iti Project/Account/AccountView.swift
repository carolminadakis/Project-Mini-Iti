//
//  AccountView.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 06/10/21.
//

import Foundation

struct AccountView {
    
    /*
     1- Criar func para cliente logar
     2- Criar a view da área do cliente logado
     3- Criar enum para opções
     */
//    
//    func login() {
//        <#function body#>
//    }
    
    func menuView() {
        print("""
    ****************************************
    *               Mini ITI               *
    ****************************************
    *                                      *
    *       Digite a opção que deseja:     *
    *                                      *
    *       [1] - Saldo                    *
    *       [2] - Deposito                 *
    *       [3] - Pagar                    *
    *       [4] - Transferência            *
    *       [5] - Pix                      *
    *       [6] - Sair                     *
    *                                      *
    ****************************************
    
    """)
    }
    
 
}

enum AccountOptions: String {
    case balance = "1"
    case deposit = "2"
    case payment = "3"
    case transference = "4"
    case pix = "5"
    case logout = "6"
    case notfound = "0"
}
