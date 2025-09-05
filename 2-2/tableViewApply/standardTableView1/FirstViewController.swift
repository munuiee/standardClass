import UIKit
import SnapKit


class FirstViewController: UIViewController {

    let tableView = UITableView()
    
    var datas = ["가나디", "농담곰", "치이카와", "춘식이", "하치와레"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegate()
        configureUI()
    }
    
    // tableView 설정
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        // 셀 등록
        self.tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.identifier)
    }
    
    // dataSource, delegate 설정
    func setTableViewDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // 셀 클릭시 didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        datas.append("셀 선택")
        tableView.reloadData()
    }

}

// dataSource, delegate 채택
extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath ) as? FirstTableViewCell
        else { return .init() }
        
        let data = datas[indexPath.row]
        cell.configure(data: data)
        cell.delegate = self
        return cell
    }
}

// protocol 채택
extension FirstViewController: FirstTableViewCellDelegate {
    func buttonClicked(data: String) {
        datas.append(data)
        tableView.reloadData()
    }
}

