import Foundation
import UIKit
import SnapKit

/*
 
 "email": "eve.holt@reqres.in",
 "password": "cityslicka"
 }
 */

class ModalViewController: UIViewController {
    var delegate: ModalDelegateProtocol?
    let network = NetworkService()
    private let modalLabel = UILabel()
    private let modalButton = UIButton()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemGray5
        [modalLabel, modalButton, emailTextField, passwordTextField]
            .forEach { view.addSubview($0) }
        
        modalLabel.text = "Modal ViewController"
        modalButton.setTitle( "Modal Button", for: .normal )
        modalButton.backgroundColor = .lightGray
        modalButton.addTarget(self, action: #selector(modalButtonClicked), for: .touchUpInside)
        emailTextField.borderStyle = .roundedRect
        passwordTextField.borderStyle = .roundedRect
        
        modalLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        modalButton.snp.makeConstraints {
            $0.centerX.equalTo(modalLabel)
            $0.top.equalTo(modalLabel.snp.bottom).offset(8)
        }
        
        emailTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.bottom.equalTo(passwordTextField.snp.top).offset(-10)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.bottom.equalTo(modalLabel.snp.top).offset(-10)
        }
    }
    
    @objc func modalButtonClicked() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let request = LoginRequest(email: email, password: password)
        
        network.makeURL(with: request) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                self.delegate?.didModalDismiss(with: response.token)
                self.dismiss(animated: true)
            case .failure(let error):
                self.errorAlert(with: .network(error.localizedDescription))
            }
        }
        
    }
    
    func errorAlert(with modalError: ModalError) {
        let alert = UIAlertController(
            title: modalError.message,
            message: nil,
            preferredStyle:.alert
        )
        alert.addAction(.init(title: "확인", style: .default))
        self.present(alert, animated: true)
    }
}
