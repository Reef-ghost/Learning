import SwiftUI
import SwiftData

@main
struct MyApp: App {

    @State private var appPhase: AppPhase = .onboarding

    @State private var currentGoal: Goal?

    private var savedGoal: Goal? {

        guard let data = UserDefaults.standard.data(forKey: "currentGoal") else {

            return nil
        }

        return try? JSONDecoder().decode(Goal.self, from: data)
    }


    var body: some Scene {

        WindowGroup {

            ZStack {
                
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                switch appPhase {
                    
                case .onboarding:
                    
                    OnboardingView { goal in
                        
                        if let data = try? JSONEncoder().encode(goal) {
                            UserDefaults.standard.set(data, forKey: "currentGoal")
                        }
                        
                        currentGoal = goal
                        appPhase = .main
                    }
                    
                case .main:
                    
                    if let goal = currentGoal {
                        
                        ContentView(
                            goal: goal,
                            onGoalChanged: { newGoal in
                                currentGoal = newGoal
                                
                                if let data = try? JSONEncoder().encode(newGoal) {
                                    UserDefaults.standard.set(data, forKey: "currentGoal")
                                }
                            }
                        )
                    }
                }
            }

            .onAppear {

                if let savedGoal {
                    currentGoal = savedGoal
                    appPhase = .main
                }
            }

            .preferredColorScheme(.dark)
        }

        .modelContainer(for: Activity.self)
    }
}

//هنا المفروض انو الخلفيه تصير تتبع السستم لكن جربت بدونها وما توقع انه لها حاجه

/*ZStack{

    Color (.systemBackground)
        .ignoresSafeArea()*/

//هنا خليته يتجاهل اختيارات النظام ويكون وضع التطبيق دارك دايركت
