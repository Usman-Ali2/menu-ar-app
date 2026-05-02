import 'package:flutter/foundation.dart'; // For kDebugMode
import 'package:flutter/material.dart'; // Core Flutter UI
import 'data/burger_data.dart'; // Hardcoded burger data
import 'screens/home_screen.dart'; // Home screen
import 'screens/scanner_screen.dart'; // Scanner screen
import 'screens/burger_detail_screen.dart'; // Detail screen
import 'screens/qr_generator_screen.dart'; // Dev QR generator screen
import 'models/burger.dart'; // Burger model

void main() { // App entry point
  runApp(const BurgerScanApp()); // Run the app
}

class BurgerScanApp extends StatelessWidget { // Root app widget
  const BurgerScanApp({super.key}); // Constructor

  @override
  Widget build(BuildContext context) { // Build method
    return MaterialApp( // Material app wrapper
      title: 'BurgerScan', // App title
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData( // App theme
        colorScheme: ColorScheme.fromSeed( // Seeded color scheme
          seedColor: Colors.orange, // Primary seed color
          secondary: Colors.brown.shade700, // Dark secondary color
        ), // End color scheme
        useMaterial3: true, // Use Material 3
        scaffoldBackgroundColor: Colors.grey.shade50, // Light background
        appBarTheme: const AppBarTheme( // AppBar theme
          foregroundColor: Colors.white, // White text/icons
          elevation: 0, // Flat app bar
        ), // End AppBar theme
      ), // End theme
      home: HomeScreen( // Initial screen
        burgers: burgerData, // Inject burger map
      ), // End home
      onGenerateRoute: (settings) { // Route generator
        if (settings.name == ScannerScreen.routeName) { // Scanner route
          return MaterialPageRoute( // Create route
            builder: (_) => ScannerScreen( // Build scanner
              burgers: burgerData, // Inject burger map
            ), // End ScannerScreen
          ); // End route
        } // End scanner route
        if (settings.name == BurgerDetailScreen.routeName) { // Detail route
          final burger = settings.arguments as Burger; // Get burger argument
          return MaterialPageRoute( // Create route
            builder: (_) => BurgerDetailScreen( // Build detail
              burger: burger, // Pass burger
            ), // End BurgerDetailScreen
          ); // End route
        } // End detail route
        if (settings.name == QRGeneratorScreen.routeName) { // QR generator route
          return MaterialPageRoute( // Create route
            builder: (_) => QRGeneratorScreen( // Build QR generator
              burgers: burgerData, // Pass burger map
            ), // End QRGeneratorScreen
          ); // End route
        } // End QR generator route
        return null; // No matching route
      }, // End onGenerateRoute
    ); // End MaterialApp
  } // End build
} // End BurgerScanApp
