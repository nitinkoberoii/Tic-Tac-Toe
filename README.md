# Flutter Tic-Tac-Toe Game

A simple and elegant Tic-Tac-Toe mobile game built with Flutter, featuring two-player functionality, win detection, and smooth animations.

## Features

- ✅ Two-player gameplay on the same device
- ✅ Clean and intuitive 3×3 grid interface
- ✅ Clear display of current player's turn (X or O)
- ✅ Automatic detection of wins and draws
- ✅ Highlighted winning combinations
- ✅ Smooth animations for player moves
- ✅ One-tap game restart functionality
- ✅ Responsive design for different screen sizes
- ✅ Light/Dark theme support

## Screenshots

![Main Screen - tictactoe](https://github.com/user-attachments/assets/fcdc35a8-ea92-4a0d-b7ff-de53c2163919)
![X wins](https://github.com/user-attachments/assets/2ced11ed-02da-4d54-9fd6-5f2a2d81e80a)
![ItsDraw](https://github.com/user-attachments/assets/1e6f12be-a54f-4e4f-a043-535a69721a95)


## Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Provider
- **Architecture**: Modular project structure

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── providers/
│   └── game_provider.dart    # Game state management
├── screens/
│   └── game_screen.dart      # Main game screen
├── utils/
│   └── game_logic.dart       # Game rules and logic
└── widgets/
    ├── game_board.dart       # Game board widget
    └── game_tile.dart        # Individual tile widget
```

## Getting Started

### Prerequisites

- Flutter SDK (ver. 2.17.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/nitinkoberoii/Tic-Tac-Toe.git
```

2. Navigate to the project directory:
```bash
cd flutter-tic-tac-toe
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Development Notes

- Provider package is used for state management
- The game includes animations for a better user experience
- The UI is designed to be responsive across different device sizes

## Future Enhancements

- Add sound effects for moves and wins
- Implement an AI opponent with difficulty levels
- Add game statistics tracking
- Add multiplayer functionality over network
- Settings page for customization options

## Acknowledgements

- Flutter team for the amazing framework
- The open-source community for inspiration and resources
