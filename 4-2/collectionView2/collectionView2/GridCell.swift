
import Foundation
import UIKit
import SnapKit

class GridCell: UICollectionViewCell {
    static let identifier = "GridCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let gridLabel = UILabel()
    let bgView = UIView()
    
    func configureUI() {
        contentView.addSubview(bgView)
        bgView.addSubview(gridLabel)
        
        gridLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        gridLabel.textAlignment = .center
        
        gridLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        bgView.backgroundColor = .systemGray6
        bgView.layer.cornerRadius = 8
        bgView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }
    
    func configure(grid: String) {
        gridLabel.text = grid
    }
}
