import Foundation

class PasswordValidator {
    let password: String = "password"
    
    private func passwordCheck(with input: String) throws -> Bool {
        if input == password {
            return true
        } else {
            throw PasswordError.wrongInput
        }
    }
    
    func validate(with input: String) throws -> Bool {
        if input.isEmpty {
            throw PasswordError.emptyInput
        } else if input.count > 8 {
            throw PasswordError.tooLongInput
        } else {
            return try passwordCheck(with: input)
        }
    }
}
