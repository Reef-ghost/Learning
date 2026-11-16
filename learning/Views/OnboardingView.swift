import SwiftUI

struct OnboardingView: View {
    @State private var topic = ""

    var body: some View {
        VStack (alignment: .leading) {
            
            //flame icon SF
            Image(systemName: "flame.fill")
                .font(.system(size: 36, weight: .bold))
                .foregroundStyle(.orange)
                .opacity(0.4)
                .frame(maxWidth: .infinity, alignment: .center)
            
            
            // رسالة الترحيب
            (Text("Hello") + Text(" Learner").bold())
                .font(.system(size: 34))
                .foregroundStyle(.primary)
            
            //تعريف التطبيق
            Text("This app will help you learn everyday!")
                .font(.system(size: 17))
                .foregroundStyle(.secondary)
                .padding(.bottom, 37)
            
            Text("I want to learn")
            
                .font(.system(size: 16))
                .foregroundStyle(.primary)

            TextField("What do you want to learn?", text: $topic)
                .font(.system(size: 17))
                .padding(.horizontal, 16)
                .frame(height: 48)
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.secondary.opacity(0.15))
                }

            Text("I want to learn it in a")
                .font(.system(size: 16))
                .foregroundStyle(.primary)
                .padding(.top, 30)

            HStack(spacing: 12) {
                Text("Week")
                    .frame(width: 84, height: 46)

                Text("Month")
                    .frame(width: 91, height: 46)

                Text("Year")
                    .frame(width: 75, height: 46)
            }
            .font(.system(size: 17, weight: .medium))

            Spacer()

            Button("Start Learning") {
                
            }
            .font(.system(size: 17, weight: .medium))
            .foregroundStyle(.white)
            .frame(width: 151, height: 46)
            .background(Color.blue)
            .clipShape(Capsule())

            Text("You can edit your desire later")
                .font(.system(size: 12))
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 28)
                
                
            
        }
    }
}
