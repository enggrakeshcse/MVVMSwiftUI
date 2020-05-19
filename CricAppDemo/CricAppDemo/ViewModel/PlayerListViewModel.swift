
import Foundation
import Combine

class PlayerListViewModel: ObservableObject {
    private var playerListService: PlayerListServices
    
    init() {
        playerListService = PlayerListServices()
    }
    var playerRoot: RootClass?
    func getPlayerDataAPI(completion: @escaping CompletionForAPIResponseStatus) {
        playerListService.getAllPlayer {[weak self] (response) in
            guard let self = self else {    return    }
            self.playerRoot = response
            completion(true)
        }
    }
    
    func getPlayerData() -> [Players] {
        if let squad = playerRoot?.squad.first {
            return squad.players ?? []
        } else {
            return []
        }
    }
}
