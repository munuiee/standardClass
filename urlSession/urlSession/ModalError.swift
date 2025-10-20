import Foundation

enum ModalError: Error {
    case URLError
    case DecodingError
    case loginError
    
    var message: String {
        switch self {
        case .URLError:
            return "URL 생성 실패"
        case .DecodingError:
            return "디코딩 실패"
        case .loginError:
            return "로그인 실패"
        }
    }
}
