import SwiftUI

struct ChangeGoalView: View {

    let currentGoal: Goal
    let onGoalChanged: (Goal) -> Void

    @Environment(\.dismiss) private var dismiss

    @State private var topic: String
    @State private var selectedDuration: GoalDuration

    init(
        currentGoal: Goal,
        onGoalChanged: @escaping (Goal) -> Void
    ) {
        self.currentGoal = currentGoal
        self.onGoalChanged = onGoalChanged

        _topic = State(initialValue: currentGoal.topic)
        _selectedDuration = State(
            initialValue: currentGoal.duration
        )
    }

    var body: some View {

        NavigationStack {

            Form {

                // MARK: - Topic

                Section("Learning Topic") {

                    TextField(
                        "What do you want to learn?",
                        text: $topic
                    )
                }

                // MARK: - Duration

                Section("Duration") {

                    Picker(
                        "Goal Duration",
                        selection: $selectedDuration
                    ) {
                        Text("Week")
                            .tag(GoalDuration.week)

                        Text("Month")
                            .tag(GoalDuration.month)

                        Text("Year")
                            .tag(GoalDuration.year)
                    }
                    .pickerStyle(.segmented)
                }

                // MARK: - Change Goal

                Section {

                    Button("Change Goal") {

                        let newGoal = Goal(
                            topic: topic,
                            duration: selectedDuration,
                            startDate: Date()
                        )

                        onGoalChanged(newGoal)
                        dismiss()
                    }
                    .disabled(topic.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
            .navigationTitle("Change Goal")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {

    ChangeGoalView(
        currentGoal: Goal(
            topic: "Swift",
            duration: .month,
            startDate: Date()
        )
    ) { newGoal in
        print(newGoal.topic)
    }
}
