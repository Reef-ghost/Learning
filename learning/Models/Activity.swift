import Foundation
import SwiftData

enum ActivityType: String, Codable {
    case learned
    case freeze
}

@Model
final class Activity {
    var date: Date
    var type: ActivityType

    init(date: Date, type: ActivityType) {
        self.date = date
        self.type = type
    }
}
