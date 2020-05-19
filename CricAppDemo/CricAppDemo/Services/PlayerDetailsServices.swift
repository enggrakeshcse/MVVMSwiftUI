
import Foundation
import SwiftyJSON

class PlayerDetailsServices {
    let session = URLSession.shared
    func getPlayerDetails(pid: Int, completionHandler: @escaping (PlayerDetailsRoot) -> Void) {
        let playerStatus = "\(baseURL)playerStats?apikey=WfB4795mmQYGqKAeD8Hdf5nuGk23&pid=\(pid)"
            //=WfB4795mmQYGqKAeD8Hdf5nuGk23&=
        var urlRequest = URLRequest(url: URL(string: playerStatus)!)
        urlRequest.httpMethod = "POST"
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSON(data: data)
                    print(json)
                    completionHandler(PlayerDetailsRoot(json))
                } catch {
                    print(error)
                }
            }
        }.resume()
      }
    
    func getImageData(url: String, completionHandler: @escaping (Data) -> Void) {
        session.dataTask(with: URL(string: url)!) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    completionHandler(data)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
