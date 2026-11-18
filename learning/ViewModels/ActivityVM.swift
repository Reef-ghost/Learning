import Foundation
import Observation

@Observable
final class ActivityVM {
    var goal: Goal
    var activities: [Activity] = []
    init(goal: Goal) {
            self.goal = goal
        }

    private var learnedToday: Bool {

        activities.contains {
            Calendar.current.isDateInToday($0.date)
            && $0.type == .learned
        }
    }

    private var freezeToday: Bool {

        activities.contains {
            Calendar.current.isDateInToday($0.date)
            && $0.type == .freeze
        }
    }
    //اللمت للفريز
    var freezeLimit: Int {
        switch goal.duration {
        case .week:
            return 2

        case .month:
            return 8

        case .year:
            return 96
        }
    }

    var canLogLearned: Bool {
        !learnedToday
    }

    var canLogFreeze: Bool {
        !freezeToday && freezeCount < freezeLimit
    }

    // يتعرف لو تم اللوق از ليرند
    func logLearned() {

        guard canLogLearned else {
            return
        }

        activities.append(
            Activity(
                date: Date(),
                type: .learned
            )
        )
    }

    // معرف الافريز لو تم استخدامها
    func logFreeze() {

        guard canLogFreeze else {
            return
        }

        activities.append(
            Activity(
                date: Date(),
                type: .freeze
            )
        )
    }

    // عداد الاتعلم والفريز
    var learnedCount: Int {

        activities.filter {
            $0.type == .learned
        }.count
    }

    var freezeCount: Int {

        activities.filter {
            $0.type == .freeze
        }.count
    }
    
    func activities(for date: Date) -> [ActivityType] {
        activities
            .filter {
                Calendar.current.isDate($0.date, inSameDayAs: date)
            }
            .map(\.type)
    }
}
