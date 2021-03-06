//
//  Validation.swift
//  Iti Project
//
//  Created by Ana Carolina Bernardes Minadakis on 06/10/21.
//

import Foundation


extension String {
    //Validação para nomes, obriga a ter nome e sobrenome, aceita caracteres especiais e acentos e não aceita números
    func isNameValid() -> Bool {
        
        let nameRegEx = "^([A-Za-zÀ-ú]{2,}\\s[A-Za-zÀ-ú.'-]{1,}'?-?[A-Za-zÀ-ú.'-]{2,}\\s?([A-Za-zÀ-ú.'-]{1,})?)"
        return NSPredicate(format: "SELF MATCHES %@", nameRegEx).evaluate(with: self)
    }
    
    func isCPFValid() -> Bool {
        let numbers = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numbers.count == 11 else { return false }
        
        let set = NSCountedSet(array: Array(numbers))
        guard set.count != 1 else { return false }
        
        let i1 = numbers.index(numbers.startIndex, offsetBy: 9)
        let i2 = numbers.index(numbers.startIndex, offsetBy: 10)
        let i3 = numbers.index(numbers.startIndex, offsetBy: 11)
        let d1 = Int(numbers[i1..<i2])
        let d2 = Int(numbers[i2..<i3])
        
        var temp1 = 0, temp2 = 0
        
        for i in 0...8 {
            let start = numbers.index(numbers.startIndex, offsetBy: i)
            let end = numbers.index(numbers.startIndex, offsetBy: i+1)
            let char = Int(numbers[start..<end])
            
            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }
        
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2
        
        return temp1 == d1 && temp2 == d2
    }
    
    func isEmailValid() -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
    }
    
    func isPhoneValid() -> Bool {
        
        let phoneRegEx = "^\\d{5}-\\d{4}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegEx).evaluate(with: self)
    }
}


