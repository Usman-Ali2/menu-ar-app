# BurgerScan (Menu AR App)

BurgerScan is a Flutter demo app that lets users scan QR codes to view burger menu details. It includes a home screen with featured burgers, a QR scanner screen that matches codes to burgers, a detail page for each burger, and a developer-only QR generator screen.

## Who should use this
- Flutter learners who want a complete example of QR scanning + detail views.
- Developers building a QR-based menu, product, or promo experience.
- Anyone exploring UI patterns for cards, detail screens, and in-app navigation.

## How it works
- **Home screen** lists featured burgers.
- **Scan** button opens the camera and scans QR codes.
- If the QR matches a burger ID, the app opens the **detail screen**.
- In debug mode, a **Dev** button shows QR codes for each burger.

## Run locally
1. Install Flutter (Dart 3+).
2. Clone the repo.
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Customize data
Burger data is currently hardcoded in:
`lib/data/burger_data.dart`

Replace those entries with your own menu items and IDs to power the QR scan flow.
