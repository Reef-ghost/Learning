import SwiftUI
import SwiftData

struct CalendarView: View {

    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Activity.date) private var activities: [Activity]

    private let calendar = Calendar.current

    var body: some View {

        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // MARK: - Header

                HStack {

                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(.white)
                            .frame(width: 40, height: 40)
                            .background(.white.opacity(0.12))
                            .clipShape(Circle())
                    }

                    Spacer()

                    Text("Activities")
                        .font(.system(size: 17, weight: .semibold))

                    Spacer()

                    Color.clear
                        .frame(width: 40, height: 40)
                }

                // MARK: - Months

                ForEach(months, id: \.self) { month in

                    MonthView(
                        month: month,
                        activities: activities
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
        }
        .background(Color.black)
        .foregroundStyle(.white)
        .navigationBarBackButtonHidden(true)
    }

    // MARK: - Months

    private var months: [Date] {

        guard let firstActivityDate = activities.map(\.date).min() else {
            return [calendar.startOfMonth(for: Date())]
        }

        let startMonth = calendar.startOfMonth(for: firstActivityDate)
        let currentMonth = calendar.startOfMonth(for: Date())

        guard let numberOfMonths = calendar.dateComponents(
            [.month],
            from: startMonth,
            to: currentMonth
        ).month else {
            return [currentMonth]
        }

        return (0...numberOfMonths).compactMap {
            calendar.date(
                byAdding: .month,
                value: $0,
                to: startMonth
            )
        }
    }
}

// MARK: - Month View

private struct MonthView: View {

    let month: Date
    let activities: [Activity]

    private let calendar = Calendar.current

    var body: some View {

        VStack(alignment: .leading, spacing: 10) {

            Text(
                month.formatted(
                    .dateTime
                        .month(.wide)
                        .year()
                )
            )
            .font(.system(size: 17, weight: .semibold))

            // MARK: - Weekday Labels

            HStack {

                ForEach(
                    ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
                    id: \.self
                ) { day in

                    Text(day)
                        .font(.system(size: 10, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.secondary)
                }
            }

            // MARK: - Days

            LazyVGrid(
                columns: Array(
                    repeating: GridItem(.flexible()),
                    count: 7
                ),
                spacing: 10
            ) {

                ForEach(daysInMonth, id: \.self) { date in

                    DayView(
                        date: date,
                        activity: activity(for: date)
                    )
                }
            }

            Divider()
                .background(.white.opacity(0.15))
        }
    }

    // MARK: - Days In Month

    private var daysInMonth: [Date] {

        guard let range = calendar.range(
            of: .day,
            in: .month,
            for: month
        ) else {
            return []
        }

        guard let firstDay = calendar.date(
            from: calendar.dateComponents(
                [.year, .month],
                from: month
            )
        ) else {
            return []
        }

        let firstWeekday = calendar.component(
            .weekday,
            from: firstDay
        )

        let emptyDays = Array(
            repeating: firstDay,
            count: firstWeekday - 1
        )

        let days = range.compactMap {
            calendar.date(
                byAdding: .day,
                value: $0 - 1,
                to: firstDay
            )
        }

        return emptyDays + days
    }

    // MARK: - Activity For Date

    private func activity(for date: Date) -> ActivityType? {

        activities.first {
            calendar.isDate(
                $0.date,
                inSameDayAs: date
            )
        }?.type
    }
}

// MARK: - Day View

private struct DayView: View {

    let date: Date
    let activity: ActivityType?

    var body: some View {

        ZStack {

            if let activity {

                Circle()
                    .fill(
                        activity == .learned
                        ? Color(
                            red: 1,
                            green: 0.573,
                            blue: 0.188
                        )
                        : Color(
                            red: 0.235,
                            green: 0.827,
                            blue: 0.996
                        )
                    )
                    .frame(
                        width: 28,
                        height: 28
                    )
            }

            Text(
                date.formatted(
                    .dateTime.day()
                )
            )
            .font(
                .system(
                    size: 14,
                    weight: .medium
                )
            )
            .foregroundStyle(
                activity == nil
                ? .white
                : .black
            )
        }
        .frame(height: 28)
    }
}

// MARK: - Calendar Helpers

private extension Calendar {

    func startOfMonth(for date: Date) -> Date {

        self.date(
            from: dateComponents(
                [.year, .month],
                from: date
            )
        ) ?? date
    }
}
