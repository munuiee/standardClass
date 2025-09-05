import UIKit
import SnapKit

class FirstTableViewCell: UITableViewCell {
    static let identifier = "FirstTableViewCell"
    let dataLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        tableSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        contentView.addSubview(dataLabel)
    }
    
    // inset()으로 여백설정
    func tableSetting() {
        dataLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
    
    func configure(data: String) {
        dataLabel.text = data
    }

}
