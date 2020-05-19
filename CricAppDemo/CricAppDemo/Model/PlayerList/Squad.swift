
import Foundation
import SwiftyJSON

struct Squad {

	let players: [Players]?
	let name: String?

	init(_ json: JSON) {
		players = json["players"].arrayValue.map { Players($0) }
		name = json["name"].stringValue
	}
}
