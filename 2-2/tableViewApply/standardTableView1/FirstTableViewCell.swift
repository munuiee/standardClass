import UIKit
import SnapKit

class FirstTableViewCell: UITableViewCell {
    static let identifier = "FirstTableViewCell"
    let dataLabel = UILabel()
    let button = UIButton()
    
    weak var delegate: FirstTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        labelConfigure()
        buttonConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        [dataLabel, button]
            .forEach {
                contentView.addSubview($0)
            }
    }
    
    func labelConfigure() {
        dataLabel.snp.makeConstraints {
            $0.top.trailing.leading.equalToSuperview().inset(20)
        }
    }
    
    func configure(data: String) {
        dataLabel.text = data
    }
    
    // button 설정
    func buttonConfigure() {
        button.setTitle("데이터 추가", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(50)
            $0.top.equalTo(dataLabel.snp.bottom).offset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
    
    @objc func buttonTapped() {
        let data = dataLabel.text ?? ""
        delegate?.buttonClicked(data: data)
    }

}
