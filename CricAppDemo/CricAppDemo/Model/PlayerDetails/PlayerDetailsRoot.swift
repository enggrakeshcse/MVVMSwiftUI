
import Foundation
import SwiftyJSON

struct PlayerDetailsRoot {

	let pid: Int?
	let country: String?
	let profile: String?
	let imageURL: String?
	let battingStyle: String?
	let bowlingStyle: String?
	let majorTeams: String?
	let currentAge: String?
	let born: String?
	let fullName: String?
	let name: String?
	let playingRole: String?
	let v: String?
	let data: Cricdata?
	let ttl: Int?
	let creditsLeft: Int?

	init(_ json: JSON) {
		pid = json["pid"].intValue
		country = json["country"].stringValue
		profile = json["profile"].stringValue
		imageURL = json["imageURL"].stringValue
		battingStyle = json["battingStyle"].stringValue
		bowlingStyle = json["bowlingStyle"].stringValue
		majorTeams = json["majorTeams"].stringValue
		currentAge = json["currentAge"].stringValue
		born = json["born"].stringValue
		fullName = json["fullName"].stringValue
		name = json["name"].stringValue
		playingRole = json["playingRole"].stringValue
		v = json["v"].stringValue
		data = Cricdata(json["data"])
		ttl = json["ttl"].intValue
		creditsLeft = json["creditsLeft"].intValue
	}
    
    var countries : String {
        return self.country ?? ""
    }
}
