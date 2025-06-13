# Random Quote Generator

A sleek, modern Flutter app that displays random quotes from a live API. Users can fetch new quotes and share them directly to social media or messaging apps. The app features a custom splash screen, animated loaders, and a polished UI.

## Features

- **Splash Screen:** Modern splash with animated loader and app logo.
- **Quote Screen:** Displays a random quote and author with a stylish card design.
- **New Quote Button:** Fetches a new random quote from the API.
- **Share Button:** Share the current quote to any social or messaging app.
- **Animated Loader:** Custom loader while fetching quotes.
- **Responsive UI:** Works on all device sizes with modern colors and fonts.

## Screens

1. **Splash Screen (`splash.dart`):**
   - Shows app logo and name with an animated loader.
   - Automatically transitions to the main quote screen.

2. **Quote Screen (`quote_screen.dart`):**
   - Displays the current quote and author.
   - "New Quote" button fetches a new quote from the API.
   - "Share" button lets users share the quote.

## API Used

- **ZenQuotes API**
  - Endpoint: [`https://zenquotes.io/api/random`](https://zenquotes.io/api/random)
  - Returns a random quote and author on each request.

## Getting Started

1. **Clone the repository:**
   ```
   git clone https://github.com/yourusername/random_quote_generator.git
   cd random_quote_generator
   ```

2. **Install dependencies:**
   ```
   flutter pub get
   ```

3. **Run the app:**
   ```
   flutter run
   ```

## Dependencies

- [http](https://pub.dev/packages/http)
- [share_plus](https://pub.dev/packages/share_plus)
- [google_fonts](https://pub.dev/packages/google_fonts)
- [flutter_spinkit](https://pub.dev/packages/flutter_spinkit)

## Folder Structure

```
lib/
├── main.dart
├── splash.dart
└── quote_screen.dart
```

## Screenshots

![Untitled design (2)](https://github.com/user-attachments/assets/c8bb6078-6d9b-41d1-ace9-034c15552815)


## License

MIT License

---

Made with ❤️ using Flutter.
