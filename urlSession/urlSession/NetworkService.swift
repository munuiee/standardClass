import Foundation

class NetworkService {
    private func makeURL(with body: LoginRequest) {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "reqres.in"
        component.path = "/api/login"
        
        guard let url = component.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "x-api-key": "reqres-free-v1"
        ]
        request.httpBody = try? JSONEncoder().encode(body)
        
        
        let session: URLSession = URLSession(configuration: .default)
        session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data)
            print(loginResponse?.token)
        }
        .resume()
    }
    
}
