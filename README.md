<p align="center">
  <img src="poster.pnga"="Learning Journey app poster" width="100%">
</p>

<h1 align="center">🔥 Learning Journey</h1>

<p align="center">
  <b>Learn something new, one day at a time.</b><br>
  <img src="https://img.shields.io/badge/SwiftUI-FF9230?style=flat-square&logo=swift&logoColor=white" alt="SwiftUI">
  <img src="https://img.shields.io/badge/iOS-000000?style=flat-square&logo=apple&logoColor=white" alt="iOS">
  <img src="https://img.shields.io/badge/Architecture-MVVM-3CD3FE?style=flat-square" alt="MVVM">
</p>

---

## 📖 About

**Learning Journey** is an iOS app that helps you build a daily learning habit.
You choose a topic and a goal length, then come back every day to log what you learned, or freeze a day when you need a break.

## ✨ Main Features

What you can do in the current build:

- **🎯 Set your learning goal:** type the topic you want to learn and choose **Week**, **Month**, or **Year**.
- **🚀 Start learning:** **Start Learning** only works after you enter a topic and pick a duration.
- **🔥 Log as Learned:** mark today as a learning day. You can log each day only once, and the button then changes to **Logged as Learned**.
- **🧊 Freeze for a day:** take a day off. Each goal has a freeze limit: **2** for a week, **8** for a month, and **96** for a year.
- **📊 Track your progress:** the **Learned** and **Freezed** cards count your days, and the app shows how many freezes you have used (for example, *1 out of 2 Freezes used*).
- **📅 This week at a glance:** a date strip shows learned days in **orange** and frozen days in **blue**.

## 🛠️ Technologies Used

| | |
|---|---|
| **SwiftUI** | Builds all the screens |
| **MVVM** | `Models` → `ViewModels` → `Views` |
| **Observation** (`@Observable`) | Keeps the screen in sync with the data |
| **Liquid Glass** (`glassEffect`) | Glass-style buttons and cards |

## 📁 Project Structure

```
learning/
├── Models/        Goal, GoalDuration, Activity, AppPhase
├── ViewModels/    OnboardingVM, ActivityVM
└── Views/         OnboardingView, ActivityView, ...
```

## 🗺️ Coming Next

These features are planned and **not in the app yet**:

- [ ] Edit your learning goal
- [ ] Monthly calendar of learned and frozen days
- [ ] Learning streak
- [ ] Goal result screen

---

<p align="center">Made with 🧡 at the Apple Developer Academy</p>
