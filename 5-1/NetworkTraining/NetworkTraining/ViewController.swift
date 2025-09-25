

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
        
        private func fetchData() {
        
        // URL 구성요소
        let scheme = "https"
        let host = "reqres.in"
        let path = "/api/users"
        let listQueryItem = URLQueryItem(name: "list", value: "2")
                
        
        // URL Components 생성
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [listQueryItem]
        
        
        // URL 변환
        if let url = components.url {
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
        } else {
            print("URL 생성 실패")
        }
        
        
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


