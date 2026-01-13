# 🏢 Company Tasks Organizer

**Company Tasks Organizer** is a smart field‑service & task management system built with **Flutter** as a graduation project.  
It was designed for a real company that repairs and installs security cameras, and helps them coordinate **missions, technicians, locations, and attendance** in one place.

> From assigning a mission… to arriving on site… to marking the job as done – everything happens inside this app. [web:29]

---

## ✨ What This App Does

- 👨‍🔧 **Technicians app**
  - Secure login to access personal workspace.
  - View today’s missions with full details: client, service type, time, and exact location.
  - Accept missions, navigate to the customer, and mark tasks as **completed** after finishing the service.
  - Track personal attendance history and work log in one place.

- 🧑‍💻 **Admin panel**
  - Add and manage employees and their data.
  - Create and assign missions, and follow their status (new, in progress, finished).
  - Monitor attendance for each employee (check‑in / check‑out) and review daily/weekly performance.
  - View daily tasks, today’s tasks, and finished tasks with detailed mission views.
  - Manage settings, backup data, and control app theme (dark/light).

- 💬 **Team communication**
  - In‑app communication between employees (chat / task discussion).
  - Push notifications when a new mission is assigned, such as:  
    > “Hello, there is new task waiting you.” [web:29]

- 🌍 **Location & navigation**
  - Store both **employee location** and **service location** for each mission.
  - Open map in a WebView/Map screen to help technicians navigate to the client site.

- 🌙 **Localization & theming**
  - Full **Arabic & English** support.
  - **Dark / Light** modes with dynamic colors and icons.
  - All texts, dates, and labels are fully localized for both languages.

---

## 🔐 Authentication & Access Flow

Authentication in **Company Tasks Organizer** is built to feel like a real production system, not just a basic login form. [web:29][web:32]

### ✅ Secure Firebase Authentication

- Email/password authentication using **Firebase Authentication** to handle identity, sessions, and security. [web:27][web:29]
- Passwords are never stored locally; all credential checks happen through Firebase’s secure backend. [web:27]
- Error‑aware UX:
  - Clear messages for wrong password, non‑existing account, or network issues.
  - Option to add password reset flow using Firebase’s reset email APIs. [web:30]

### 🧩 Role‑Based Access Control

- Each user has an associated **role** (e.g. `admin`, `technician`) stored in backend user data or claims. [web:32]
- After a successful login:
  - If role is **admin** → user is routed to the **AdminLayout** with access to missions, employees, attendance, settings, and backup modules.
  - If role is **technician** → user is routed to the **technician experience** focused on assigned tasks and personal attendance.
- Unauthorized access to admin-only screens is blocked at the navigation and state level, keeping sensitive tools restricted to admins. [web:32][web:35]

### 🔁 Smart App Flow (Splash → Auth → Role)

1. **Splash Screen**
   - Initializes Firebase.
   - Reads cached theme (dark / light) and language (AR / EN) from local storage.
   - Checks if there is a valid Firebase user session. [web:29][web:36]

2. **Auth Check**
   - If no authenticated user:
     - Navigate to `LoginScreen` where the user enters email & password.
   - If authenticated:
     - Fetch user profile & role, then:
       - `admin` → open `AdminLayout`.
       - `technician` → open technician home/tasks screen. [web:32][web:39]

3. **Live Session Handling**
   - If the user logs out or the session becomes invalid, the app safely redirects back to the login screen.
   - Future enhancements can include email verification / password reset flows on top of this base. [web:27][web:37]

> This flow makes the app feel like an internal company system with **secure login, clear separation of roles, and smooth navigation** right from the splash screen.

---

## 🧱 Under the Hood

- **Framework**: Flutter  
- **Architecture & State**: `flutter_bloc` (Cubit / Bloc) for predictable state management  
- **Backend & Cloud**: Firebase (Authentication, Messaging) [web:29]
- **Notifications**: Firebase Cloud Messaging (FCM) for real‑time task alerts [web:29]
- **Local Storage**: Shared Preferences (`CacheHelper`) for theme, language, and small user settings [web:36]
- **Localization**:
  - `localize_and_translate`
  - `flutter_localizations`
  - `translator`
- **UI & Utilities**:
  - Custom AppBar & BottomNavigation theming
  - `fluttertoast` for in‑app alerts
  - `month_year_picker` for filtering attendance and reports

---

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
# - Make sure firebase_options.dart is generated and valid (FlutterFire CLI)

# Run the app
flutter run
