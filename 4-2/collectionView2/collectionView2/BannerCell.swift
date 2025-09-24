//
//  BannerCell.swift
//  collectionView2
//
//  Created by 변지혜 on 9/23/25.
//

import Foundation
import UIKit
import SnapKit

class BannerCell: UICollectionViewCell {
    static let identifier = "BannerCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel = UILabel()
    let bgView = UIView()
    
    func configureUI() {
        contentView.addSubview(bgView)
        bgView.addSubview(titleLabel)
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .white
        bgView.layer.cornerRadius = 16
        bgView.backgroundColor = .purple
        
        bgView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
