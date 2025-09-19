import Foundation
import UIKit

class MyFlowLayout: UICollectionViewFlowLayout {
    private let columns: CGFloat
    private let sectionInsetValue: CGFloat
    private let itemSpacing: CGFloat
    private let rowSpacing: CGFloat
    private let itemHeight: CGFloat
    
    init(columns: CGFloat = 3,
         sectionInsetValue: CGFloat = 16,
         itemSpacing: CGFloat = 8,
         rowSpacing: CGFloat = 8,
         itemHeight: CGFloat = 80) {
        self.columns = columns
        self.sectionInsetValue = sectionInsetValue
        self.itemSpacing = itemSpacing
        self.rowSpacing = rowSpacing
        self.itemHeight = itemHeight
        super.init()
        
        scrollDirection = .vertical
        minimumInteritemSpacing = itemSpacing
        minimumLineSpacing = rowSpacing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func itemSize(for collectionView: UICollectionView) -> CGSize {
        let width = collectionView.bounds.width
        let availableWidth = (width - (sectionInset.left + sectionInset.right) - minimumInteritemSpacing * (columns - 1))
        let itemWidth = availableWidth / columns
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
