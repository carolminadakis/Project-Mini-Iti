//
//  RegisterView.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 08/10/21.
//

import Foundation

struct GenericView {
    

func header() {
    let header: String = """
        ****************************************
        *     Mini ITI - Cadastro de Conta     *
        ****************************************
        
        """
    
    print(header + "\n")
    }
    
    func getName() {
        print("Nome completo: ")
    }
    
    func getDocument() {
        print("CPF: ")
    }
    
    func getCellPhoneNumber() {
        print("Celular: ")
    }
    
    func getPixKey() {
        print("Digite a chave pix: ")
    }
    
    func getAddress() {
        print("Endereço: ")
    }
    
    func getOccupation() {
        print("Profissão: ")
    }
    
    func getIncome() {
        print("Renda salárial: ")
    }
    
    func getPassword() {
        print("Senha: ")
    }
    func getValue() {
        print("Valor: ")
    }
    
    func logout() {
        print("******* Volte sempre! ********")
    }
    
    func invalidOption() {
        print("Opção inválida.")
    }
    
    func getAgency()  {
        print("Agencia: ")
    }
    func getAccount()  {
        print("Conta: ")
    }
}
