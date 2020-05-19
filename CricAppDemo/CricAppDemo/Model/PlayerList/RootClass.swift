
import Foundation
import SwiftyJSON

struct RootClass {

    var squad: [Squad] = []
    var cache: Bool = false
    var v: String = ""
    var ttl: Int = 0
    var creditsLeft: Int? = 0

	init(_ json: JSON) {
		squad = json["squad"].arrayValue.map { Squad($0) }
		cache = json["cache"].boolValue
		v = json["v"].stringValue
		ttl = json["ttl"].intValue
		creditsLeft = json["creditsLeft"].intValue
	}
    init() {
        
    }
}
