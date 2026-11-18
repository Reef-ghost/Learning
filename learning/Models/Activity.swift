import Foundation

enum ActivityType {
    case learned
    case freeze
}

struct Activity {
    var date: Date
    var type: ActivityType
}
