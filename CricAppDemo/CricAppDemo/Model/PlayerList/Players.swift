
import Foundation
import SwiftyJSON
import SwiftUI

struct Players: Identifiable {
    var id = UUID()
	var pid: Int?
	var name: String?
    
    init(pid: Int, name: String) {
        self.pid = pid
        self.name = name
    }
	init(_ json: JSON) {
		pid = json["pid"].intValue
		name = json["name"].stringValue
	}

}
