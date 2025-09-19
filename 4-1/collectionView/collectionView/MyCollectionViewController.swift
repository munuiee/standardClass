import UIKit
import SnapKit

class MyCollectionViewController: UIViewController {

    
    private let items = Array(1...20)
    private var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: MyFlowLayout(columns: 3)
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(
            MyCollectionViewCell.self,
            forCellWithReuseIdentifier: MyCollectionViewCell.identifier
        )
        
       // view.addSubview(collectionView)
    }
    

    
    
}

extension MyCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell else { return .init() }
        
        let item = items[indexPath.item]
        cell.configure(number: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? MyFlowLayout else { return .init() }
        return layout.itemSize(for: collectionView)
        }
    
    
}
