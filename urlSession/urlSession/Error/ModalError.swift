import Foundation

enum ModalError: Error {
    case network(String)
    case URLError
    case DecodingError
    case loginError
    
    var message: String {
        switch self {
        case .URLError:
            return "URL 생성에 실패했어요."
        case .DecodingError:
            return "디코딩 실패 오류"
        case .loginError:
            return "로그인에 실패했어요."
        case .network:
            return "네트워크 오류"
        }
    }
}
