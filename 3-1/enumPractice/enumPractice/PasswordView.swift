// UI 레이아웃

import Foundation
import UIKit

class PasswordView: UIView {
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let passwordButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        [passwordLabel, passwordTextField, passwordButton]
            .forEach { addSubview($0) }
        
        self.backgroundColor = .white
        
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
    
}
