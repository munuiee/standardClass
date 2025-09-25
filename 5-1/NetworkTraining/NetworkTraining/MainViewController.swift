

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        
        guard let url: URL = URL(string: "https://reqres.in/api/users?list=2") else {
            print("URL is not correct")
            return
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session: URLSession = URLSession(configuration: .default)
        session.dataTask(with: request) { data, response, error in
            guard let data, error == nil else { return }
            
            // 디코딩
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(UserPageModel.self, from: data)
                print(result)
                
            } catch {
                print("디코딩 실패")
            }
        }
        .resume()
        
    }
    
    
}




