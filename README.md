# ⚡ GridX7 — AI-Powered Smart Microgrid Management

GridX7 is an intelligent energy monitoring and management platform that combines IoT, cloud computing, and artificial intelligence to monitor solar energy generation, battery status, and electricity consumption in real time.

Built with Flutter, ESP32, and Firebase, GridX7 provides an interactive dashboard, energy analytics, intelligent alerts, and AI-powered assistance for smarter and more efficient microgrid management.

## 🚀 Features

- **Real-Time Monitoring** — Monitor solar voltage, current, power, irradiance, and light intensity.
- **Battery Monitoring** — Track battery voltage and energy storage conditions.
- **AC Power Analysis** — Monitor AC voltage, RMS current, and real power.
- **Interactive Dashboard** — Visualize live telemetry and energy statistics.
- **Firebase Integration** — Synchronize sensor data through Firebase Realtime Database.
- **AI Assistant** — Get assistance interpreting energy data and understanding system conditions.
- **Smart Alerts** — Receive notifications about important energy conditions.
- **Microgrid Management** — Establish a foundation for remote monitoring and intelligent energy optimization.

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform mobile application |
| Dart | Application development |
| ESP32 | IoT hardware and sensor data collection |
| Firebase Realtime Database | Real-time cloud data synchronization |
| Firebase Cloud Messaging | Push notifications |
| AI Integration | Conversational energy assistance |

## 🏗️ System Architecture

```text
Solar Panels & Sensors
         │
         ▼
    ESP32 Controller
         │
         ▼
Firebase Realtime Database
         │
         ▼
   Flutter Application
         │
         ├── Live Monitoring
         ├── Energy Analytics
         ├── Alerts & Notifications
         └── AI Assistant
```

## ⚙️ Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Firebase project
- ESP32 development board and compatible sensors

### Installation

1. Clone the repository:

   ```bash
   git clone <YOUR_REPOSITORY_URL>
   ```

2. Navigate to the project directory:

   ```bash
   cd GridX7
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Configure your Firebase project and add the appropriate platform configuration files.

5. Configure the Firebase Realtime Database connection and required environment settings.

6. Run the application:

   ```bash
   flutter run
   ```

## 🔐 Configuration

- Configure Firebase credentials using the recommended platform-specific setup.
- Set up the required database structure and access rules.
- Store AI API keys securely on the backend or in Firebase Cloud Functions rather than exposing them in the mobile application.
- Configure ESP32 sensor connections and data transmission according to your hardware setup.

**Note:** Exact configuration steps depend on the repository structure and implemented integrations.

## 🎯 Project Objectives

- Improve visibility into renewable energy generation and consumption.
- Enable centralized monitoring of microgrid components.
- Support informed energy management decisions.
- Integrate AI-assisted insights into energy monitoring.
- Establish a foundation for predictive analytics and automated energy optimization.

## 🔮 Future Enhancements

- AI-based energy demand forecasting.
- Solar generation prediction.
- Battery health and performance analytics.
- Automated load balancing.
- Advanced anomaly detection.
- Intelligent energy distribution and optimization.

## 🤝 Contributing

Contributions, suggestions, and feature requests are welcome. Fork the repository, create a feature branch, and submit a pull request.

## 📄 License

Choose an appropriate open-source license before distributing this project. Until a license is added, all rights remain with the copyright holder.

---

**GridX7 — Smarter Monitoring. Better Energy Management.** ⚡🌱
