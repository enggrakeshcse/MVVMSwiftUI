
import Foundation
import SwiftyJSON

struct Cricdata {

	let bowling: Bowling?
	let batting: Batting?

	init(_ json: JSON) {
		bowling = Bowling(json["bowling"])
		batting = Batting(json["batting"])
	}

}
