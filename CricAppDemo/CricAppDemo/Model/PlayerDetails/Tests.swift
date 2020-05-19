
import Foundation
import SwiftyJSON

struct Tests {

	let fifty: String?
	let hundred: String?
	let St: String?
	let Ct: String?
	let sixes: String?
	let fours: String?
	let SR: String?
	let BF: String?
	let Ave: String?
	let HS: String?
	let Runs: String?
	let NO: String?
	let Inns: String?
	let Mat: String?
    let tensW: String?
    let fiveW: String?
    let fourW: String?
    let wicket: String?
    let balls: String?

	init(_ json: JSON) {
		fifty = json["50"].stringValue
		hundred = json["100"].stringValue
		St = json["St"].stringValue
		Ct = json["Ct"].stringValue
		sixes = json["6s"].stringValue
		fours = json["4s"].stringValue
		SR = json["SR"].stringValue
		BF = json["BF"].stringValue
		Ave = json["Ave"].stringValue
		HS = json["HS"].stringValue
		Runs = json["Runs"].stringValue
		NO = json["NO"].stringValue
		Inns = json["Inns"].stringValue
		Mat = json["Mat"].stringValue
        tensW = json["10"].stringValue
        fiveW = json["5w"].stringValue
        fourW = json["4w"].stringValue
        wicket = json["Wkts"].stringValue
        balls = json["Balls"].stringValue
	}

}
