
import Foundation
import SwiftyJSON

struct Provider {

	let source: String?
	let url: String?
	let pubDate: String?

	init(_ json: JSON) {
		source = json["source"].stringValue
		url = json["url"].stringValue
		pubDate = json["pubDate"].stringValue
	}

}
