//
//  PixView.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 11/10/21.
//

import Foundation

struct PixView {
    
    func pixViewMenu() {
        print("""
    ****************************************
    *               ÁREA PIX               *
    ****************************************
    *                                      *
    *       [1] - E-MAIL                   *
    *       [2] - CELULAR                  *
    *       [3] - CPF                      *
    *                                      *
    *       [0] - Voltar                   *
    *                                      *
    ****************************************

    """)
    }
    
    func pixInitialMenu() {
        print("""
    ****************************************
    *               MENU PIX               *
    ****************************************
    *                                      *
    *       [1] - Cadastrar                *
    *       [2] - Transferir/Pagar         *
    *                                      *
    *       [3] - Voltar                   *
    *                                      *
    ****************************************

    """)
    }
}


enum PixMenu: String {
    case register = "1"
    case payment = "2"
    case returnMenu = "3"
    case notfound
}
