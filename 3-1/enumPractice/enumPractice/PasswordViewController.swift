

import UIKit
import SnapKit

class PasswordViewController: UIViewController {
    
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let passwordButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    func configure() {
        [passwordLabel, passwordTextField, passwordButton]
            .forEach { view.addSubview($0) }
        
        view.backgroundColor = .white
        
        // passwordLabel 레이아웃
        passwordLabel.text = ""
        passwordLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        // passwordTextField 레이아웃
        passwordTextField.borderStyle = .roundedRect
        
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(passwordLabel.snp.top).offset(-10)
        }
        
        passwordButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        // passwordButton 레이아웃
        passwordButton.setTitle("입력", for: .normal)
        passwordButton.backgroundColor = .red
        
        passwordButton.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(50)
            $0.top.equalTo(passwordLabel.snp.bottom).offset(10)
            $0.centerX.equalTo(passwordLabel.snp.centerX)
        }
    }
    
    @objc private func buttonClicked() {
        if passwordTextField.text == "password" {
            passwordLabel.text = "성공"
        }
    }


}

