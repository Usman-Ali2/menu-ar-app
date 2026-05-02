import 'package:flutter/material.dart'; // Flutter UI

class ScanOverlay extends StatefulWidget { // Overlay widget
  const ScanOverlay({super.key}); // Constructor

  @override
  State<ScanOverlay> createState() => _ScanOverlayState(); // Create state
} // End widget

class _ScanOverlayState extends State<ScanOverlay> with SingleTickerProviderStateMixin { // State with animation
  late final AnimationController _controller; // Animation controller
  late final Animation<double> _scanLine; // Scan line animation

  @override
  void initState() { // Init
    super.initState(); // Call super
    _controller = AnimationController( // Controller
      vsync: this, // Ticker
      duration: const Duration(seconds: 2), // Duration
    )..repeat(); // Repeat
    _scanLine = Tween<double>(begin: 0, end: 1).animate(_controller); // Tween
  } // End initState

  @override
  void dispose() { // Dispose
    _controller.dispose(); // Dispose controller
    super.dispose(); // Call super
  } // End dispose

  @override
  Widget build(BuildContext context) { // Build
    return LayoutBuilder( // Get constraints
      builder: (context, constraints) { // Builder
        final width = constraints.maxWidth * 0.7; // Frame width
        final height = constraints.maxHeight * 0.4; // Frame height
        final top = (constraints.maxHeight - height) / 2; // Frame top
        final left = (constraints.maxWidth - width) / 2; // Frame left
        return Stack( // Stack overlay
          children: [ // Children
            Positioned( // Frame
              top: top, // Top
              left: left, // Left
              width: width, // Width
              height: height, // Height
              child: CustomPaint( // Custom paint
                painter: _CornerPainter(), // Corner painter
              ), // End custom paint
            ), // End positioned
            AnimatedBuilder( // Animated scan line
              animation: _scanLine, // Animation
              builder: (context, child) { // Builder
                return Positioned( // Positioned line
                  top: top + (height * _scanLine.value), // Move line
                  left: left, // Left
                  width: width, // Width
                  child: Container( // Line
                    height: 2, // Height
                    color: Colors.greenAccent, // Color
                  ), // End container
                ); // End positioned
              }, // End builder
            ), // End animated builder
          ], // End children
        ); // End stack
      }, // End builder
    ); // End LayoutBuilder
  } // End build
} // End state

class _CornerPainter extends CustomPainter { // Corner painter
  @override
  void paint(Canvas canvas, Size size) { // Paint method
    final paint = Paint() // Paint object
      ..color = Colors.greenAccent // Green color
      ..strokeWidth = 4 // Stroke width
      ..style = PaintingStyle.stroke; // Stroke style
    const corner = 24.0; // Corner length
    final rect = Rect.fromLTWH(0, 0, size.width, size.height); // Frame rect
    canvas.drawPath( // Draw corners
      Path() // Path
        ..moveTo(rect.left, rect.top + corner) // Top-left vertical
        ..lineTo(rect.left, rect.top) // To corner
        ..lineTo(rect.left + corner, rect.top) // Top-left horizontal
        ..moveTo(rect.right - corner, rect.top) // Top-right horizontal
        ..lineTo(rect.right, rect.top) // To corner
        ..lineTo(rect.right, rect.top + corner) // Top-right vertical
        ..moveTo(rect.right, rect.bottom - corner) // Bottom-right vertical
        ..lineTo(rect.right, rect.bottom) // To corner
        ..lineTo(rect.right - corner, rect.bottom) // Bottom-right horizontal
        ..moveTo(rect.left + corner, rect.bottom) // Bottom-left horizontal
        ..lineTo(rect.left, rect.bottom) // To corner
        ..lineTo(rect.left, rect.bottom - corner), // Bottom-left vertical
      paint, // Paint
    ); // End drawPath
  } // End paint

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false; // No repaint
} // End painter
