
import Foundation
import SwiftyJSON

struct Bowling {

	let listA: ListA?
	let firstClass: FirstClass?
	let t20Is: T20Is?
	let oDIs: ODIs?
	let tests: Tests?

	init(_ json: JSON) {
		listA = ListA(json["listA"])
		firstClass = FirstClass(json["firstClass"])
		t20Is = T20Is(json["T20Is"])
		oDIs = ODIs(json["ODIs"])
		tests = Tests(json["tests"])
	}

}
