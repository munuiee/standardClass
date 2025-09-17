

import UIKit
import SnapKit

class PasswordViewController: UIViewController {
    let validator = PasswordValidator()
    
    private let passwordView = PasswordView()
    
    // view를 passwordView로 교체
    override func loadView() {
        view = passwordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 이벤트
        passwordView.passwordButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }

    
    @objc private func buttonClicked() {
        guard let input = passwordView.passwordTextField.text else { return }
        do {
            let isValid = try validator.validate(with: input)
            if isValid {
                passwordView.passwordLabel.text = "성공"
            }
        } catch {
            guard let error = error as? PasswordError else { return }
            errorAlert(with: error)
        }
    }
    
    func errorAlert(with alertMessage: PasswordError) {
        let alert = UIAlertController(
            title: "오류가 발생했습니다.",
            message: alertMessage.errorMessage,
            preferredStyle: .alert
        )
        let alertButton = UIAlertAction(title: "확인", style: .default)
        alert.addAction(alertButton)
        present(alert, animated: true)
    }
    


}

