

import UIKit
import SnapKit

class PasswordViewController: UIViewController {
    
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
        if passwordView.passwordTextField.text == "password" {
            passwordView.passwordLabel.text = "성공"
        }
    }


}

