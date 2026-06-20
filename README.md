# Travel Journal App

A simple and intuitive mobile application built with Flutter that allows users to document their travel experiences. Users can record the places they visit by adding a title, personal notes, and a web image URL to visualize their memories in a clean, card-based feed.

## Instructions for Build and Use

Steps to build and/or run the software:

1. Download and install the Flutter SDK on your system.
2. Open Android Studio (or VS Code) and open the `cs3_project` folder.
3. Start your Android Emulator (e.g., Pixel 10 Pro) from the Device Manager.
4. Open the `lib/main.dart` file and ensure your emulator is selected as the target device in the top bar.
5. Click the green "Run" (Play) button or type `flutter run` in the terminal to launch the app.

Instructions for using the software:

1. When the app opens, you will see a welcome screen stating "No entries yet. Start exploring!".
2. Tap the floating "+" button at the bottom right corner of the screen to open the creation form.
3. Fill in the "Location / Title", write your travel "Notes", and paste a direct image URL from the internet.
4. Tap the "Save Entry" button to submit your log.
5. The app will automatically navigate back to the main screen, and your new trip will appear as a styled card in the list.

## Development Environment

To recreate the development environment, you need the following software and/or libraries with the specified versions:

* Flutter SDK (Version 3.x or higher)
* Dart SDK (Version 3.x or higher)
* Android Studio (with the Flutter and Dart plugins installed)
* Android Toolchain & Android Emulator (API 30+)
* `flutter_launcher_icons` library (Version ^0.13.1) configured in `pubspec.yaml`

## Useful Websites to Learn More

I found these websites useful in developing this software:

* [Flutter Documentation](https://docs.flutter.dev/) - Official guides for widgets, layout, and state management.
* [Codying with Flutter](https://codewithandrea.com/) - Excellent articles on navigation and input forms.
* [Pub.dev - flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) - Package documentation for setting up the custom mobile launcher icon.

## Future Work

The following items I plan to fix, improve, and/or add to this project in the future:

* [ ] Add persistent local storage (using Hive or SharedPreferences) so logs don't disappear when closing the app.
* [ ] Integrate the native phone camera using the `image_picker` package instead of relying on web URLs.
* [ ] Add a details page to open and read full-screen notes when clicking on a travel card.