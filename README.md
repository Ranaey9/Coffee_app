# Coffee App

This is a modern Flutter mobile application designed for a coffee shop experience. The project focuses on core e-commerce functionalities such as product discovery, category management, and a personalized user experience through favorites and shopping carts.

## Key Features

- **Product Search**: Real-time filtering of coffee products based on name.
- **Category Navigation**: Quick access to Hot Drinks, Cold Drinks, and Snacks categories.
- **Favorite System**: Ability to mark products as favorites and view them in a persistent dedicated section.
- **Shopping Cart**: Full cart functionality including item addition and real-time count tracking.
- **Detailed View**: Specific pages for each product featuring high-quality images and descriptions.

## Technical Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Local state management using setState
- **Navigation**: Material Routing and Bottom Navigation Bar

## Project Structure

```text
lib/
├── models/      # Data models and Kahve class definitions
├── screen/      # UI screens: Home, Detail, and Favorites
├── Sepet/       # Cart logic and shopping basket interface
└── main.dart    # Application entry point

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Ranaey9/Coffee_app.git
2. Navigate to the project directory:
cd Coffee_app
3. Install dependencies:
flutter pub get
4. Run code generation:
dart run build_runner build --delete-conflicting-outputs
5. Run the app:
flutter run