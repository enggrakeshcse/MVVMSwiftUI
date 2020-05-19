

import SwiftUI

struct ContentView: View {

    @ObservedObject var playerListViewModel: PlayerListViewModel
    @State var player = [Players]()
    
    init() {
        playerListViewModel = PlayerListViewModel()
        player = playerListViewModel.getPlayerData()
    }
    
    private func addTask() {
        playerListViewModel.getPlayerDataAPI { (check) in
            if check {
                self.player = self.playerListViewModel.getPlayerData()
            }
        }
        //test.append(Task(name: "check it"))
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(player) { players in
                    HStack {
                        NavigationLink(destination: PlayerDetails(player: players)) {
                            Text(players.name ?? "")
                        }
                    }
                }
            }.onAppear() {
                self.addTask()
            }
            .navigationBarTitle("Player", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
