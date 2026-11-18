import SwiftUI

struct OnboardingView: View {
    let onComplete: (Goal) -> Void
    // هذا المتغير داخله ربط الحاله بالفيو مودل
    @State private var viewModel = OnboardingVM()
    
    
    var body: some View {
         // هنا احتاج افهم البايندبل زين
        @Bindable var bindableViewModel = self.viewModel
        
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {

                // MARK: - Header

                Image(systemName: "flame.fill")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(.orange)
                    .opacity(0.4)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 60)
                    .padding(.bottom, 80)

                (Text("Hello") + Text(" Learner").bold())
                    .font(.system(size: 34))
                    .foregroundStyle(.primary)
                    .padding(.horizontal, 16)

                Text("This app will help you learn everyday!")
                    .font(.system(size: 17))
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 37)

                // MARK: - Learning Topic

                Text("I want to learn")
                    .font(.system(size: 16))
                    .foregroundStyle(.primary)
                    .padding(.horizontal, 16)
               //هنا  بروسس ربط الموضوع  من الفيو للفيو مودل الي هو اللوجيك
                TextField("What do you want to learn?", text: $bindableViewModel.topic )
                    .font(.system(size: 17))
                    .foregroundStyle(.primary)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.secondary.opacity(0.15))
                    }
                    .padding(.bottom, 30)

                // MARK: - Duration

                Text("I want to learn it in a")
                    .font(.system(size: 16))
                    .foregroundStyle(.primary)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 13)

                GlassEffectContainer(spacing: 12) {
                    HStack(spacing: 12) {
                      // هنا ميثود الازرار
                        Button("Week") {
                            
                            // هنا وقت ربط الازرار بالحاله
                            bindableViewModel.selectedDuration = .week
                        }
                        .frame(width: 84, height: 46)
                        .foregroundStyle(.primary)
                        .glassEffect(
                            .regular
                                .tint(
                                    
                                    // هنا لو المستخدم اختار الويك يتغير لونه للبرتقالي
                                   bindableViewModel.selectedDuration == .week
                                    ? .orange
                                    : .clear
                                  ),
                            
                            in: .capsule
                        )

                        Button("Month") {
                            
                            bindableViewModel.selectedDuration = .month
                        }
                        .frame(width: 91, height: 46)
                        .foregroundStyle(.primary)
                        .glassEffect(
                            .regular
                                .tint(
                                    
                                // هنا لو المستخدم اختار الشهر يتغير لونه للبرتقالي
                               bindableViewModel.selectedDuration == .month
                                ? .orange
                                : .clear
                              ),
                            
                            in: .capsule
                        )

                        Button("Year") {
                            
                            bindableViewModel.selectedDuration = .year
                        }
                        .frame(width: 75, height: 46)
                        .foregroundStyle(.primary)
                        .glassEffect(
                            .regular
                                .tint(
                                    // هنا لو المستخدم اختار السنه 
                                    bindableViewModel.selectedDuration == .year
                                    
                                    ? .orange
                                    : .clear
                                    
                                ),
                            
                            
                            
                            in: .capsule
                        )
                    }
                }
                .padding(.horizontal, 16)

                Spacer()

                // MARK: - Start Learning

                Button("Start Learning") {
                    
                    bindableViewModel.startLearning()
                    
                    if let goal = bindableViewModel.goal {
                        onComplete(goal)
                    }
                }
                .font(.system(size: 17, weight: .medium))
                .foregroundStyle(.white)
                .frame(width: 151, height: 46)
                .glassEffect(
                    .regular
                        .tint(.orange)
                        .interactive(),
                    in: .capsule
                )
                .frame(maxWidth: .infinity)

                Text("You can edit your desire later")
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 12)
                    .padding(.bottom, 28)
            }
            .frame(maxHeight: .infinity)
            
        }
    }
}
