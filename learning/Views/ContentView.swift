import SwiftUI
import Playgrounds

struct ContentView: View {
    
    let goal: Goal
    
    var body: some View {
           ActivityView(goal: goal)
       }
    
}

#Preview {
    ContentView(goal: Goal(
        topic: "Swift",
        duration: .week,
        startDate: Date()
    )
)
}

#Playground {
    _ = 1 + 2
}
