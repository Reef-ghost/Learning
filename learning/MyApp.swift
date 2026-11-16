import SwiftUI

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            //هنا المفروض انو الخلفيه تصير تتبع السستم لكن جربت بدونها وما توقع انه لها حاجه
            ZStack{
                Color (.systemBackground)
                    .ignoresSafeArea()
                
                
                OnboardingView()
                
            }
            //هنا خليته يتجاهل اختيازات النظام ويكون وضع التطبيق دارك دايركت
            .preferredColorScheme(.dark)
        }
    }
        
}
