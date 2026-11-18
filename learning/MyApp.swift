import SwiftUI

@main struct MyApp: App {
    
    @State private var appPhase: AppPhase = .onboarding
    @State private var currentGoal: Goal?
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                switch appPhase {
                case .onboarding:
                    
                    OnboardingView { goal in
                        currentGoal = goal
                        appPhase = .main
                    
                    }
                    
                case .main:
                    if let currentGoal {
                        ContentView(goal: currentGoal)
                    }
                }
            }
        }
    }
}
            //هنا المفروض انو الخلفيه تصير تتبع السستم لكن جربت بدونها وما توقع انه لها حاجه
            /*ZStack{
                Color (.systemBackground)
                    .ignoresSafeArea()*/
            
            //هنا خليته يتجاهل اختيارات النظام ويكون وضع التطبيق دارك دايركت
            //.preferredColorScheme(.dark)
        


