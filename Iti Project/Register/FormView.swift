//
//  LogInAccountView.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 04/10/21.
//

import Foundation

struct FormView {
    
    func header() {
        print("""
            ****************************************
            *     Mini ITI - Cadastro de Conta     *
            ****************************************
            
            """)
    }

    func getClientInput() -> String? {
        let clientInput = readLine()
        return clientInput
    }

}
