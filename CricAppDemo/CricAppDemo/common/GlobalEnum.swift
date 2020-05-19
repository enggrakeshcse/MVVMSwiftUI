
import Foundation

enum TypeOfInfo {
    case info, bowling, batting
    func title() -> String {
        switch self {
        case .info:
            return "Info"
        case .bowling:
            return "Batting"
        case .batting:
            return "Bowling"
        }
    }
    
    static func typeofInfoArray() -> [TypeOfInfo] {
        return [info, .batting, bowling]
    }
    
}
