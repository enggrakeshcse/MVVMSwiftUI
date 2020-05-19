

import SwiftUI

struct PlayerDetails: View {
    var player: Players
    @ObservedObject var playerDetailsViewModel = PlayerDetailsViewModel()
    @State var playerDetailsRoot : PlayerDetailsRoot?
    @State var imageData = Data()
    @State var pickerSelection = 0
    @State var pickerArray = TypeOfInfo.typeofInfoArray()
    
    private func addTask() {
        playerDetailsViewModel.getPlayerDetailsDataAPI(pid: player.pid ?? 0) { (check) in
            if check {
                self.playerDetailsRoot = self.playerDetailsViewModel.getPlayerDetailsData()
                self.playerDetailsViewModel.getPlayerImageAPI(url: self.playerDetailsRoot?.imageURL ?? "https://www.cricapi.com/playerpic/\(String(describing: self.player.pid)).jpg") { (isCheck) in
                    if isCheck {
                        self.imageData = self.playerDetailsViewModel.imageData
                    }
                }
            }
        }
    }
    
    var body: some View {
        Color.gray
            .overlay(
                ScrollView(.vertical, showsIndicators: true) {
                        MyPicker(typeOfInfo: pickerArray, selectedIndex: $pickerSelection)
                        if self.pickerSelection == 0 {
                            Image(uiImage: UIImage(data: imageData) ?? UIImage())
                                .clipShape(Circle())
                            Text(playerDetailsRoot?.name ?? "")
                            Text(playerDetailsRoot?.countries ?? "")
                            PlayerPersonalDetails(playerDetails: playerDetailsRoot)
                            Text("Player Role: \(playerDetailsRoot?.playingRole ?? "")")
                                .multilineTextAlignment(.leading)
                            Text("Born: \(playerDetailsRoot?.born ?? "")")
                                .multilineTextAlignment(.leading)
                            Text("Profile: \(playerDetailsRoot?.profile ?? "")")
                                .multilineTextAlignment(.leading)
                        } else {
                            HStack {
                                Text("               ")
                                Text("First  ")
                                Text("Odi  ")
                                Text("Test  ")
                                Text("T-20  ")
                                Spacer()
                            }
                            if self.pickerSelection == 1 {
                            HStack{
                                Text("SR:         ")
                                Text("\(playerDetailsRoot?.data?.bowling?.firstClass?.SR ?? "N/A") ")
                                Text("\(playerDetailsRoot?.data?.bowling?.oDIs?.SR ?? "N/A") ")
                                Text("\(playerDetailsRoot?.data?.bowling?.tests?.SR ?? "N/A")  ")
                                Text("\(playerDetailsRoot?.data?.bowling?.t20Is?.SR ?? "N/A")")
                                Spacer()
                            }
                            HStack{
                                Text("Wickets:")
                                Text("\(playerDetailsRoot?.data?.bowling?.firstClass?.wicket ?? "N/A")  ")
                                Text("\(playerDetailsRoot?.data?.bowling?.oDIs?.wicket ?? "N/A")   ")
                                Text("\(playerDetailsRoot?.data?.bowling?.tests?.wicket ?? "N/A")  ")
                                Text("\(playerDetailsRoot?.data?.bowling?.t20Is?.wicket ?? "N/A")")
                                Spacer()
                                }
                            } else {
                                HStack {
                                    Text("Runs:   ")
                                    Text("\(playerDetailsRoot?.data?.batting?.firstClass?.Runs ?? "N/A")  ")
                                    Text("\(playerDetailsRoot?.data?.batting?.oDIs?.Runs ?? "N/A")   ")
                                    Text("\(playerDetailsRoot?.data?.batting?.tests?.Runs ?? "N/A")  ")
                                    Text("\(playerDetailsRoot?.data?.batting?.t20Is?.Runs ?? "N/A")")
                                    Spacer()
                                }
                                HStack {
                                    Text("50s:    ")
                                    Text("\(playerDetailsRoot?.data?.batting?.firstClass?.fifty ?? "N/A")  ")
                                    Text("\(playerDetailsRoot?.data?.batting?.oDIs?.fifty ?? "N/A")   ")
                                    Text("\(playerDetailsRoot?.data?.batting?.tests?.fifty ?? "N/A")  ")
                                    Text("\(playerDetailsRoot?.data?.batting?.t20Is?.fifty ?? "N/A")")
                                    Spacer()
                                }
                                HStack {
                                    Text("100s:    ")
                                    Text("\(playerDetailsRoot?.data?.batting?.firstClass?.hundred ?? "N/A")  ")
                                    Text("\(playerDetailsRoot?.data?.batting?.oDIs?.hundred ?? "N/A")   ")
                                    Text("\(playerDetailsRoot?.data?.batting?.tests?.hundred ?? "N/A")  ")
                                    Text("\(playerDetailsRoot?.data?.batting?.t20Is?.hundred ?? "N/A")")
                                    Spacer()
                                }
                            }
                    }
                        }.navigationBarTitle("Player Details", displayMode: .inline)
                            .onAppear() {
                                self.addTask()
                        }
                        .padding()
        )
       
    }
}

struct PlayerPersonalDetails: View {
    
    @State var playerDetailsRoot: PlayerDetailsRoot?
    
    init(playerDetails: PlayerDetailsRoot?) {
        self.playerDetailsRoot = playerDetails
    }
    var body: some View {
        Text("Personal Details")
            .multilineTextAlignment(.leading)
    }
}

struct PlayerDetails_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyPicker: View {
    let typeOfInfo: [TypeOfInfo]
    @Binding var selectedIndex: Int
    var body: some View {
        VStack {
            Picker(selection: $selectedIndex, label: Text("Color")) {
                ForEach(0..<typeOfInfo.count) { index in
                    Text(String(stringLiteral: self.typeOfInfo[index].title())).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
        }
    }
}
