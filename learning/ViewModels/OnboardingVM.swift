import Foundation
import Observation

@Observable

final class OnboardingVM {
    
    var topic = ""
    var selectedDuration: GoalDuration?
    var goal: Goal?
    var canStart:Bool {
        
        !topic.isEmpty && selectedDuration != nil
    }
    //عشان نتحقق ان المستخدم اختار مدة
    func startLearning() {
        guard !topic.isEmpty, let selectedDuration else {
            return
        }
        
        goal = Goal(
            topic: topic,
            duration: selectedDuration,
            startDate: Date()
        )
        
        
    }
    
    
    
    
    
    
    
    
    
    }
    
    

