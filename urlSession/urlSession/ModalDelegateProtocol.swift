import Foundation

protocol ModalDelegateProtocol: AnyObject {
    func didModalDismiss(with token: String)
}
