import 'package:flutter/material.dart'; // Flutter UI
import 'package:mobile_scanner/mobile_scanner.dart'; // Mobile scanner
import '../models/burger.dart'; // Burger model
import '../widgets/scan_overlay.dart'; // Scan overlay
import 'burger_detail_screen.dart'; // Detail screen

class ScannerScreen extends StatefulWidget { // Scanner screen widget
  static const routeName = '/scanner'; // Route name
  final Map<String, Burger> burgers; // Burger map

  const ScannerScreen({ // Constructor
    super.key, // Key
    required this.burgers, // Burger map
  }); // End constructor

  @override
  State<ScannerScreen> createState() => _ScannerScreenState(); // Create state
} // End widget

class _ScannerScreenState extends State<ScannerScreen> { // State class
  bool _isProcessing = false; // Prevent multiple scans

  @override
  Widget build(BuildContext context) { // Build method
    return Scaffold( // Scaffold
      appBar: AppBar( // AppBar
        title: const Text('Scan QR Code'), // Title
        backgroundColor: Colors.orange, // Background color
      ), // End AppBar
      body: Stack( // Overlay scanner + UI
        children: [ // Stack children
          MobileScanner( // Camera scanner
            onDetect: (capture) { // On QR detected
              if (_isProcessing) return; // Ignore duplicates
              final barcode = capture.barcodes.firstOrNull; // Get first barcode
              final raw = barcode?.rawValue; // Get raw value
              if (raw == null) return; // Ignore null
              _isProcessing = true; // Lock processing
              final burger = widget.burgers[raw]; // Find burger by ID
              if (burger != null) { // If match found
                Navigator.pushReplacement( // Replace with detail
                  context, // Context
                  MaterialPageRoute( // Route
                    builder: (_) => BurgerDetailScreen(burger: burger), // Build detail
                  ), // End route
                ); // End push replacement
              } else { // If not found
                ScaffoldMessenger.of(context).showSnackBar( // Show snackbar
                  const SnackBar(content: Text('QR code not recognized')), // Message
                ); // End snackbar
                _isProcessing = false; // Unlock processing
              } // End if
            }, // End onDetect
            onPermissionSet: (context, granted) { // Permission callback
              if (!granted) { // If permission denied
                ScaffoldMessenger.of(context).showSnackBar( // Show snackbar
                  const SnackBar(content: Text('Camera permission denied')), // Message
                ); // End snackbar
              } // End if
            }, // End onPermissionSet
          ), // End MobileScanner
          const ScanOverlay(), // Animated overlay
          Positioned( // Positioned instructions
            bottom: 24, // Bottom spacing
            left: 0, // Left edge
            right: 0, // Right edge
            child: Center( // Center text
              child: Container( // Text container
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding
                decoration: BoxDecoration( // Decoration
                  color: Colors.black.withOpacity(0.6), // Semi-transparent background
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ), // End decoration
                child: const Text( // Text
                  'Align QR code within the frame', // Instruction
                  style: TextStyle(color: Colors.white), // Style
                ), // End text
              ), // End container
            ), // End center
          ), // End positioned
        ], // End children
      ), // End stack
    ); // End scaffold
  } // End build
} // End state
