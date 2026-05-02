import 'package:flutter/foundation.dart'; // For kDebugMode
import 'package:flutter/material.dart'; // Flutter UI
import '../models/burger.dart'; // Burger model
import '../widgets/burger_card.dart'; // Burger card widget
import 'scanner_screen.dart'; // Scanner screen
import 'burger_detail_screen.dart'; // Detail screen
import 'qr_generator_screen.dart'; // QR generator screen

class HomeScreen extends StatelessWidget { // Home screen widget
  final Map<String, Burger> burgers; // Burger map

  const HomeScreen({ // Constructor
    super.key, // Key
    required this.burgers, // Required burger map
  }); // End constructor

  @override
  Widget build(BuildContext context) { // Build method
    final burgerList = burgers.values.toList(); // Convert map to list
    return Scaffold( // Page scaffold
      appBar: _GradientAppBar(title: 'BurgerScan 🍔'), // Custom gradient app bar
      floatingActionButton: kDebugMode // Show dev button only in debug
          ? FloatingActionButton.extended( // FAB for dev
              onPressed: () { // Tap handler
                Navigator.push( // Push route
                  context, // Context
                  MaterialPageRoute( // Route
                    builder: (_) => QRGeneratorScreen(burgers: burgers), // Build screen
                  ), // End route
                ); // End push
              }, // End onPressed
              label: const Text('Dev'), // Button label
              icon: const Icon(Icons.qr_code), // Button icon
            ) // End FAB
          : null, // Hide in release
      body: ListView( // Scrollable content
        padding: const EdgeInsets.all(20), // Page padding
        children: [ // Children widgets
          const _PulsingScanIcon(), // Animated scan icon
          const SizedBox(height: 16), // Spacing
          ElevatedButton.icon( // Scan button
            onPressed: () { // Tap handler
              Navigator.push( // Push scanner
                context, // Context
                MaterialPageRoute( // Route
                  builder: (_) => ScannerScreen(burgers: burgers), // Build scanner
                ), // End route
              ); // End push
            }, // End onPressed
            icon: const Icon(Icons.qr_code_scanner), // Icon
            label: const Text('Scan QR Code'), // Label
            style: ElevatedButton.styleFrom( // Button style
              padding: const EdgeInsets.symmetric(vertical: 16), // Height
              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Text style
              backgroundColor: Colors.orange, // Button color
              foregroundColor: Colors.white, // Text/icon color
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Rounded corners
            ), // End style
          ), // End button
          const SizedBox(height: 12), // Spacing
          const Center( // Centered subtitle
            child: Text( // Subtitle text
              'Tap to scan & discover your burger', // Subtitle
              style: TextStyle(color: Colors.black54), // Style
            ), // End text
          ), // End center
          const SizedBox(height: 24), // Spacing
          Text( // Section title
            'Featured Burgers', // Title text
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold), // Style
          ), // End title
          const SizedBox(height: 12), // Spacing
          ...burgerList.map((burger) { // Map to cards
            return Padding( // Add spacing
              padding: const EdgeInsets.only(bottom: 12), // Bottom spacing
              child: BurgerCard( // Burger card widget
                burger: burger, // Pass burger
                onTap: () { // Tap handler
                  Navigator.push( // Push detail
                    context, // Context
                    MaterialPageRoute( // Route
                      builder: (_) => BurgerDetailScreen(burger: burger), // Build detail
                    ), // End route
                  ); // End push
                }, // End onTap
              ), // End card
            ); // End padding
          }).toList(), // End mapping
        ], // End children
      ), // End ListView
    ); // End Scaffold
  } // End build
} // End HomeScreen

class _GradientAppBar extends StatelessWidget implements PreferredSizeWidget { // Gradient app bar
  final String title; // Title text

  const _GradientAppBar({required this.title}); // Constructor

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // AppBar size

  @override
  Widget build(BuildContext context) { // Build method
    return AppBar( // AppBar
      title: Text(title), // Title
      flexibleSpace: Container( // Gradient background
        decoration: const BoxDecoration( // Decoration
          gradient: LinearGradient( // Gradient
            colors: [Color(0xFFFF8A00), Color(0xFFFF5E00)], // Orange gradient colors
            begin: Alignment.topLeft, // Start
            end: Alignment.bottomRight, // End
          ), // End gradient
        ), // End decoration
      ), // End flexibleSpace
      centerTitle: true, // Center title
    ); // End AppBar
  } // End build
} // End _GradientAppBar

class _PulsingScanIcon extends StatefulWidget { // Animated icon widget
  const _PulsingScanIcon(); // Constructor

  @override
  State<_PulsingScanIcon> createState() => _PulsingScanIconState(); // Create state
} // End widget

class _PulsingScanIconState extends State<_PulsingScanIcon> with SingleTickerProviderStateMixin { // State class
  late final AnimationController _controller; // Animation controller
  late final Animation<double> _scale; // Scale animation

  @override
  void initState() { // Init
    super.initState(); // Call super
    _controller = AnimationController( // Create controller
      vsync: this, // Ticker
      duration: const Duration(seconds: 2), // Duration
    )..repeat(reverse: true); // Repeat animation
    _scale = Tween<double>(begin: 0.9, end: 1.1).animate( // Scale tween
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut), // Curved animation
    ); // End animation
  } // End initState

  @override
  void dispose() { // Dispose
    _controller.dispose(); // Dispose controller
    super.dispose(); // Call super
  } // End dispose

  @override
  Widget build(BuildContext context) { // Build
    return Center( // Centered icon
      child: ScaleTransition( // Scale animation
        scale: _scale, // Use scale animation
        child: Container( // Icon container
          padding: const EdgeInsets.all(24), // Padding
          decoration: BoxDecoration( // Decoration
            color: Colors.orange.withOpacity(0.15), // Light orange background
            shape: BoxShape.circle, // Circle shape
          ), // End decoration
          child: const Icon( // Scan icon
            Icons.qr_code_scanner, // Icon data
            size: 48, // Icon size
            color: Colors.orange, // Icon color
          ), // End icon
        ), // End container
      ), // End scale transition
    ); // End center
  } // End build
} // End state
