import SwiftUI

struct ActivityView: View {

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {

                // MARK: - Navigation Bar

                HStack(spacing: 0) {
                    Text("Activity")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.white)

                    Spacer()

                    GlassEffectContainer(spacing: 12) {
                        HStack(spacing: 12) {

                            Button {
                                // Calendar
                            } label: {
                                Image(systemName: "calendar")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundStyle(.white)
                                    .frame(width: 44, height: 44)
                            }
                            .glassEffect(
                                .regular
                                    .tint(.black.opacity(0.85))
                                    .interactive(),
                                in: .circle
                            )

                            Button {
                                // Edit
                            } label: {
                                Image(systemName: "pencil")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundStyle(.white)
                                    .frame(width: 44, height: 44)
                            }
                            .glassEffect(
                                .regular
                                    .tint(.black.opacity(0.85))
                                    .interactive(),
                                in: .circle
                            )
                        }
                    }
                }
                .padding(.horizontal, 15)
                .frame(height: 46)

                // MARK: - Date

                Text("Thursday, 24 October")
                    .font(.system(size: 17))
                    .foregroundStyle(
                        Color(
                            red: 0.557,
                            green: 0.557,
                            blue: 0.576
                        )
                    )
                    .padding(.horizontal, 15)
                    .frame(width: 393, height: 27, alignment: .leading)

                // MARK: - Calendar

                VStack(spacing: 0) {

                    HStack(spacing: 10) {
                        WeekDayHeader("S")
                        WeekDayHeader("M")
                        WeekDayHeader("T")
                        WeekDayHeader("W")
                        WeekDayHeader("T")
                        WeekDayHeader("F")
                        WeekDayHeader("S")
                    }
                    .frame(height: 18)

                    HStack(spacing: 10) {
                        DayCell(day: "20", state: .completed)
                        DayCell(day: "21", state: .completed)
                        DayCell(day: "22", state: .completed)
                        DayCell(day: "23", state: .completed)
                        DayCell(day: "24", state: .today)
                        DayCell(day: "25", state: .normal)
                        DayCell(day: "26", state: .normal)
                    }
                    .padding(.top, 4)
                }
                .frame(width: 365, height: 70)
                .padding(.leading, 14)
                .padding(.top, 12)

                // MARK: - Statistics

                GlassEffectContainer(spacing: 12) {
                    HStack(spacing: 12) {

                        StatCard(
                            icon: "flame.fill",
                            iconColor: .orange,
                            value: "4 days",
                            title: "Learned"
                        )

                        StatCard(
                            icon: "snowflake",
                            iconColor: Color(
                                red: 0.235,
                                green: 0.827,
                                blue: 0.996
                            ),
                            value: "0 days",
                            title: "Freezed"
                        )
                    }
                }
                .padding(.horizontal, 14)
                .padding(.top, 8)

                // MARK: - Learned Action

                Button {
                    // Log as Learned
                } label: {
                    Text("Log as Learned")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(width: 272, height: 272)
                }
                .background(
                    Color(
                        red: 1,
                        green: 0.573,
                        blue: 0.188
                    )
                )
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(
                            Color.white.opacity(0.18),
                            lineWidth: 1
                        )
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 48)

                // MARK: - Freeze Action

                Button {
                    // Freeze for a day
                } label: {
                    Text("Freeze for a day")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(width: 272, height: 46)
                }
                .background(
                    Color(
                        red: 0.235,
                        green: 0.827,
                        blue: 0.996
                    )
                )
                .clipShape(Capsule())
                .overlay {
                    Capsule()
                        .stroke(
                            Color.white.opacity(0.18),
                            lineWidth: 1
                        )
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 48)

                // MARK: - Freeze Usage

                Text("0 out of 2 Freezes used")
                    .font(.system(size: 14))
                    .foregroundStyle(
                        Color(
                            red: 0.557,
                            green: 0.557,
                            blue: 0.576
                        )
                    )
                    .frame(maxWidth: .infinity)
                    .padding(.top, 16)
            }
        }
    }
}

// MARK: - Week Day Header

private struct WeekDayHeader: View {

    let title: String

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        Text(title)
            .font(.system(size: 13, weight: .bold))
            .foregroundStyle(.white)
            .frame(width: 44, height: 18)
    }
}

// MARK: - Day Cell

private struct DayCell: View {

    enum DayState {
        case normal
        case completed
        case today
    }

    let day: String
    let state: DayState

    var body: some View {
        Text(day)
            .font(
                .system(
                    size: 20,
                    weight: state == .normal
                        ? .regular
                        : .semibold
                )
            )
            .foregroundStyle(
                state == .today
                    ? Color.white
                    : state == .completed
                        ? Color.orange
                        : Color.white
            )
            .frame(width: 44, height: 44)
            .background {
                switch state {
                case .normal:
                    Circle()
                        .fill(.clear)

                case .completed:
                    Circle()
                        .fill(
                            Color(
                                red: 1,
                                green: 0.573,
                                blue: 0.188
                            )
                            .opacity(0.15)
                        )

                case .today:
                    Circle()
                        .fill(
                            Color(
                                red: 1,
                                green: 0.573,
                                blue: 0.188
                            )
                        )
                }
            }
    }
}

// MARK: - Stat Card

private struct StatCard: View {

    let icon: String
    let iconColor: Color
    let value: String
    let title: String

    var body: some View {
        VStack(spacing: 0) {

            Image(systemName: icon)
                .font(.system(size: 15, weight: .black))
                .foregroundStyle(iconColor)
                .padding(.top, 14)

            Text(value)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.white)
                .padding(.top, 16)

            Text(title)
                .font(.system(size: 12))
                .foregroundStyle(.white)
                .padding(.top, 6)
        }
        .frame(width: 177, height: 102)
        .background(
            Color(
                red: 0.102,
                green: 0.102,
                blue: 0.102
            )
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 34)
        )
        .glassEffect(
            .regular.tint(.black.opacity(0.25)),
            in: .rect(cornerRadius: 34)
        )
    }
}

// MARK: - Preview

#Preview {
    ActivityView()
}
