import SwiftUI
import SwiftData
import Playgrounds

struct ContentView: View {

    let goal: Goal
    let onGoalChanged: (Goal) -> Void

    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ActivityView(
            goal: goal,
            modelContext: modelContext,
            onGoalChanged: onGoalChanged
        )
    }
}

#Preview {
    
    ContentView(
        goal: Goal(
            topic: "Swift",
            duration: .week,
            startDate: Date()
        ),
        onGoalChanged: { _ in }
    )
    .modelContainer(
        for: Activity.self,
        inMemory: true
    )
}
#Playground {
            _ = 1 + 2
        }
    
