# 🏢 Company Tasks Organizer

**Company Tasks Organizer** is a smart field‑service & task management system built with **Flutter** as a graduation project.  
It was designed for a real company that repairs and installs security cameras, and helps them coordinate **missions, technicians, locations, and attendance** in one place.

> From assigning a mission… to arriving on site… to marking the job as done – everything happens inside this app.

---

## ✨ What This App Does

- 👨‍🔧 **Technicians app**
  - Log in securely and see today’s missions.
  - View full mission details: client, service type, date, and exact location.
  - Accept the mission, navigate to the customer, and mark it as **completed** when done.
  - See personal attendance history and work log.

- 🧑‍💻 **Admin panel**
  - Add and manage employees and their data.
  - Assign missions and follow their status (new, in progress, finished).
  - Track attendance for each employee (check‑in / check‑out).
  - View daily tasks, today’s tasks, and finished tasks with details.
  - Manage settings, backup data, and control app theme (dark/light).

- 💬 **Team communication**
  - In‑app communication between employees (chat / task discussion).
  - Push notifications when a new mission is assigned:
    > “Hello, there is new task waiting you.”

- 🌍 **Location & navigation**
  - Save both **employee location** and **service location**.
  - Open map (WebView) to navigate to the client site.

- 🌙 **Localization & theming**
  - Full **Arabic & English** support.
  - **Dark / Light** modes with dynamic colors.
  - All texts, dates and labels are localized.

---

## 🧱 Under the Hood

- **Framework**: Flutter  
- **Architecture & State**: `flutter_bloc` (Cubit / Bloc)  
- **Backend & Cloud**: Firebase (Authentication, Messaging)  
- **Notifications**: Firebase Cloud Messaging (FCM) – real‑time task alerts  
- **Local Storage**: Shared Preferences (`CacheHelper`) for theme & session  
- **Localization**:
  - `localize_and_translate`
  - `flutter_localizations`
  - `translator`
- **UI & Utilities**:
  - Custom AppBar & BottomNavigation theming
  - `fluttertoast` for in‑app alerts
  - `month_year_picker` for attendance filtering
## 🚀 Getting Started

```bash
# Clone the repository
git clone https://github.com/your-username/company_tasks_organizer.git
cd company_tasks_organizer

# Install dependencies
flutter pub get

# Configure Firebase (Android / iOS)
# - Add google-services.json (Android)
# - Add GoogleService-Info.plist (iOS)
# - Make sure firebase_options.dart is generated and valid

# Run the app
flutter run
