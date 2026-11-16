import SwiftUI

struct OnboardingView: View {
    @State private var topic = ""

    var body: some View {
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

                TextField("What do you want to learn?", text: $topic)
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

                        Button("Week") {
                        }
                        .frame(width: 84, height: 46)
                        .foregroundStyle(.secondary)
                        .glassEffect(
                            .regular,
                            in: .capsule
                        )

                        Button("Month") {
                        }
                        .frame(width: 91, height: 46)
                        .foregroundStyle(.secondary)
                        .glassEffect(
                            .regular,
                            in: .capsule
                        )

                        Button("Year") {
                        }
                        .frame(width: 75, height: 46)
                        .foregroundStyle(.secondary)
                        .glassEffect(
                            .regular,
                            in: .capsule
                        )
                    }
                }
                .padding(.horizontal, 16)

                Spacer()

                // MARK: - Start Learning

                Button("Start Learning") {
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
        }
    }
}
