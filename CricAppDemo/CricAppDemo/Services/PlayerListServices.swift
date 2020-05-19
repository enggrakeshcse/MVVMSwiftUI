

import Foundation
import SwiftyJSON

class PlayerListServices {
    let session = URLSession.shared
    func getAllPlayer(completionHandler: @escaping (RootClass) -> Void) {
        //?apikey=WfB4795mmQYGqKAeD8Hdf5nuGk23&unique_id=1034809
        var urlRequest = URLRequest(url: URL(string: "\(baseURL)fantasySquad?apikey=WfB4795mmQYGqKAeD8Hdf5nuGk23&unique_id=1034809")!)
        urlRequest.httpMethod = "GET"
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSON(data: data)
                    print(json)
                    completionHandler(RootClass(json))
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
