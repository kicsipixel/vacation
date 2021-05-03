import Foundation

public class APIService {
    public static let shared = APIService()
    
    public enum APIError: Error {
        case error(_ errorString: String)
    }
    
    public func getJSON<T:Decodable>(urlString: String, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.error("Error. Invalid URL.")))
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.error("Error: \(error.localizedDescription)...")))
                return
            }
            
            guard let data = data else {
                completion(.failure(.error("Error. Data is corrupt.")))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(T.self, from: data)
                completion(.success(decodeData))
                return
            } catch _ {
                completion(.failure(.error("Error: \(error?.localizedDescription ?? "Problem...")")))
                return
            }
        }.resume()
    }
    
    public func postData<T:Decodable>(personName: String, carriedOver: Int,newVacation:Int, taken:Int , completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: "https://apex.oracle.com/pls/apex/vacation/api/v1/people/") else { return }
        
        let uploadDataModel = People.Item(pname: personName, carriedOver: carriedOver, newVacation: newVacation)
        
        guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.error("Error(POST): \(error.localizedDescription)...")))
                return
            }
            
            guard let jsonData = data else {
                completion(.failure(.error("Error. Data is corrupt.")))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(T.self, from: jsonData)
                completion(.success(decodeData))
                return
            } catch _ {
                completion(.failure(.error("Error: \(error?.localizedDescription ?? "Problem with POST response.")")))
                return
            }
        }.resume()
    }
}
