import Foundation

enum PasswordError: Error {
    case emptyInput
    case tooLongInput
    case wrongInput
    
    var errorMessage: String {
        switch self {
        case .emptyInput:
            return "패스워드를 입력해주세요."
        case .tooLongInput:
            return "패스워드는 8자 이하입니다."
        case .wrongInput:
            return "패스워드가 틀렸습니다."
        }
    }
}
