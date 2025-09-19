import Foundation
import UIKit
import SnapKit

class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCollectionViewCell"
    
    var numberLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        contentView.backgroundColor = .systemGray2
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.addSubview(numberLabel)
        numberLabel.textAlignment = .center
        numberLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }
    
    func configure(number: Int) {
        numberLabel.text = "\(number)"
    }
}
