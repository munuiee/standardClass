import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    private let firstLabel = UILabel()
    private let firstButton = UIButton()
    let modalVC = ModalViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        [firstLabel, firstButton]
            .forEach { view.addSubview($0) }
        
        firstLabel.text = "First ViewController"
        firstButton.setTitle("First button", for: .normal)
        firstButton.backgroundColor = .systemBrown
        firstButton.addTarget(self, action: #selector(openModal), for: .touchUpInside)
        
        firstLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        firstButton.snp.makeConstraints {
            $0.centerX.equalTo(firstLabel)
            $0.top.equalTo(firstLabel.snp.bottom).offset(8)
        }
    }
    
    @objc func openModal() {
        modalVC.delegate = self
        present(modalVC, animated: true)
    }
    
    func changeText(with text: String) {
        firstLabel.text = text
    }
    
    
}

extension FirstViewController: ModalDelegateProtocol {
    func didModalDismiss(with token: String) {
        changeText(with: token)
    }
}
