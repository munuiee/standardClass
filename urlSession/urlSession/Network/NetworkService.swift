import Foundation

class NetworkService {
    func makeURL(with body: LoginRequest, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
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
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  let data = data else { return }
            
            guard (200...299).contains(response.statusCode) else {
                let httpError = NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Status code \(response.statusCode)"])
                DispatchQueue.main.async {
                    completion(.failure(httpError))
                }
                return
            }
            
            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(loginResponse))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
