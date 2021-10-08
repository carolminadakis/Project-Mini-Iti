//
//  ShowView.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 04/10/21.
//

import Foundation

struct MainView {
    
    func startingMainView() {
        print("""
            ****************************************
            *        Bem-vindo(a) ao Mini ITI      *
            ****************************************
            *                                      *
            *       Digite a opção que deseja:     *
            *                                      *
            *       [1] - Cadastrar conta          *
            *       [2] - Logar conta              *
            *       [0] - Sair                     *
            *                                      *
            ****************************************
            
            """)
    }
}

enum MainOptions: String {
    case register = "1"
    case login = "2"
    case logout = "0"
    case notFound
}
