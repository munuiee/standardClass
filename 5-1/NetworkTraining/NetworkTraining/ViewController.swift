

import UIKit

class ViewController: UIViewController {
    
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
                let result = try decoder.decode(Welcome.self, from: data)
                print(result)
                
            } catch {
                print("디코딩 실패")
            }
        }
        .resume()
        
    }
    
    
}


// MARK: - Welcome
struct Welcome: Codable {
    let page, perPage, total, totalPages: Int
    let data: [Datum]
    let support: Support
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}


