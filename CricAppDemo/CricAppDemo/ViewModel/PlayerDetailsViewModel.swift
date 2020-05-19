
import Foundation
import Combine

class PlayerDetailsViewModel: ObservableObject {
    private var playerDetailsService: PlayerDetailsServices
    
    init() {
        playerDetailsService = PlayerDetailsServices()
    }
    var playerDetailsRoot: PlayerDetailsRoot?
    var imageData = Data()
    func getPlayerDetailsDataAPI(pid: Int, completion: @escaping CompletionForAPIResponseStatus) {
        playerDetailsService.getPlayerDetails(pid: pid) { [weak self] (playerDetails) in
            guard let self = self else { return }
            self.playerDetailsRoot = playerDetails
            completion(true)
        }
    }
    
    func getPlayerImageAPI(url: String, completion: @escaping CompletionForAPIResponseStatus) {
        playerDetailsService.getImageData(url: url) { [weak self] (data) in
            guard let self = self else {return}
            self.imageData = data
            completion(true)
        }
    }
    
    func getPlayerDetailsData() -> PlayerDetailsRoot? {
       return playerDetailsRoot
    }
    
    func getImageData() -> Data {
        return imageData
    }
}
