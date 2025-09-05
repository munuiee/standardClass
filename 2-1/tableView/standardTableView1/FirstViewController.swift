import UIKit
import SnapKit


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath ) as? FirstTableViewCell
        else { return .init() }
        
        let data = datas[indexPath.row]
        cell.configure(data: data)
        return cell
    }
    
    
    // 테이블뷰 인스턴스 생성
    let tableView = UITableView()
    
    var datas = ["가나디", "농담곰", "치이카와", "춘식이", "하치와레"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
      
        self.tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.identifier)
    }


}

