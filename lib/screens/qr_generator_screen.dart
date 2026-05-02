import 'package:flutter/material.dart'; // Flutter UI
import 'package:qr_flutter/qr_flutter.dart'; // QR generator
import '../models/burger.dart'; // Burger model

class QRGeneratorScreen extends StatelessWidget { // QR generator screen
  static const routeName = '/qr-generator'; // Route name
  final Map<String, Burger> burgers; // Burger map

  const QRGeneratorScreen({ // Constructor
    super.key, // Key
    required this.burgers, // Burger map
  }); // End constructor

  @override
  Widget build(BuildContext context) { // Build
    final burgerList = burgers.values.toList(); // Convert map to list
    return Scaffold( // Scaffold
      appBar: AppBar( // AppBar
        title: const Text('Dev QR Codes'), // Title
        backgroundColor: Colors.orange, // Background
      ), // End AppBar
      body: ListView.builder( // List of QR codes
        padding: const EdgeInsets.all(20), // Padding
        itemCount: burgerList.length, // Count
        itemBuilder: (context, index) { // Item builder
          final burger = burgerList[index]; // Burger
          return Card( // Card
            elevation: 3, // Shadow
            margin: const EdgeInsets.only(bottom: 16), // Spacing
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Rounded
            child: Padding( // Padding
              padding: const EdgeInsets.all(16), // Padding
              child: Column( // Column
                crossAxisAlignment: CrossAxisAlignment.start, // Align left
                children: [ // Children
                  Text( // Burger title
                    '${burger.name} (${burger.id})', // Title
                    style: const TextStyle(fontWeight: FontWeight.bold), // Style
                  ), // End text
                  const SizedBox(height: 12), // Spacing
                  Center( // Center QR
                    child: QrImageView( // QR widget
                      data: burger.id, // QR data
                      size: 200, // QR size
                      backgroundColor: Colors.white, // Background
                    ), // End QR
                  ), // End center
                ], // End children
              ), // End column
            ), // End padding
          ); // End card
        }, // End itemBuilder
      ), // End list
    ); // End scaffold
  } // End build
} // End screen
