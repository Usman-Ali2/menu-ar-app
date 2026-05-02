import 'package:cached_network_image/cached_network_image.dart'; // Cached images
import 'package:flutter/material.dart'; // Flutter UI
import 'package:shimmer/shimmer.dart'; // Shimmer effect
import '../models/burger.dart'; // Burger model
import '../widgets/star_rating.dart'; // Star rating widget

class BurgerDetailScreen extends StatefulWidget { // Detail screen
  static const routeName = '/detail'; // Route name
  final Burger burger; // Burger data

  const BurgerDetailScreen({ // Constructor
    super.key, // Key
    required this.burger, // Burger
  }); // End constructor

  @override
  State<BurgerDetailScreen> createState() => _BurgerDetailScreenState(); // Create state
} // End widget

class _BurgerDetailScreenState extends State<BurgerDetailScreen> with SingleTickerProviderStateMixin { // State with animation
  late final AnimationController _controller; // Animation controller
  late final Animation<Offset> _slide; // Slide animation

  @override
  void initState() { // Init
    super.initState(); // Call super
    _controller = AnimationController( // Create controller
      vsync: this, // Ticker
      duration: const Duration(milliseconds: 600), // Duration
    ); // End controller
    _slide = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate( // Slide tween
      CurvedAnimation(parent: _controller, curve: Curves.easeOut), // Curved animation
    ); // End slide
    _controller.forward(); // Start animation
  } // End initState

  @override
  void dispose() { // Dispose
    _controller.dispose(); // Dispose controller
    super.dispose(); // Call super
  } // End dispose

  @override
  Widget build(BuildContext context) { // Build
    final burger = widget.burger; // Local burger
    return Scaffold( // Scaffold
      appBar: AppBar( // AppBar
        title: Text(burger.name), // Title
        backgroundColor: Colors.orange, // Background
      ), // End AppBar
      body: SlideTransition( // Slide animation
        position: _slide, // Slide offset
        child: ListView( // Scrollable content
          padding: const EdgeInsets.all(20), // Padding
          children: [ // Children
            Hero( // Hero animation
              tag: burger.id, // Tag matches list
              child: ClipRRect( // Rounded image
                borderRadius: BorderRadius.circular(16), // Rounded corners
                child: CachedNetworkImage( // Cached image
                  imageUrl: burger.imageUrl, // Image URL
                  height: 280, // Fixed height
                  width: double.infinity, // Full width
                  fit: BoxFit.cover, // Cover fit
                  placeholder: (context, url) { // Placeholder
                    return Shimmer.fromColors( // Shimmer widget
                      baseColor: Colors.grey.shade300, // Base color
                      highlightColor: Colors.grey.shade100, // Highlight
                      child: Container( // Placeholder box
                        color: Colors.white, // Solid fill
                      ), // End container
                    ); // End shimmer
                  }, // End placeholder
                  errorWidget: (_, __, ___) => Container( // Error widget
                    height: 280, // Match height
                    color: Colors.grey.shade300, // Grey background
                    child: const Icon(Icons.broken_image, size: 48), // Error icon
                  ), // End error widget
                ), // End image
              ), // End clip
            ), // End hero
            const SizedBox(height: 16), // Spacing
            Row( // Title row
              crossAxisAlignment: CrossAxisAlignment.center, // Align center
              children: [ // Row children
                Expanded( // Expand for name
                  child: Text( // Name text
                    burger.name, // Burger name
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold), // Style
                  ), // End text
                ), // End expanded
                Container( // Price badge
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Padding
                  decoration: BoxDecoration( // Decoration
                    color: Colors.green.shade600, // Green background
                    borderRadius: BorderRadius.circular(999), // Pill shape
                  ), // End decoration
                  child: Text( // Price text
                    '\$${burger.price.toStringAsFixed(2)}', // Price value
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Style
                  ), // End text
                ), // End price badge
              ], // End row children
            ), // End row
            const SizedBox(height: 8), // Spacing
            Row( // Rating row
              children: [ // Children
                const StarRating(rating: 4.5), // Hardcoded rating
                const SizedBox(width: 12), // Spacing
                Container( // Calories badge
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), // Padding
                  decoration: BoxDecoration( // Decoration
                    color: Colors.orange.shade100, // Light orange
                    borderRadius: BorderRadius.circular(12), // Rounded
                  ), // End decoration
                  child: Text( // Calories text
                    '${burger.calories} kcal', // Calories value
                    style: TextStyle(color: Colors.orange.shade900, fontWeight: FontWeight.w600), // Style
                  ), // End text
                ), // End badge
              ], // End children
            ), // End row
            const SizedBox(height: 16), // Spacing
            Text( // Description
              burger.description, // Description text
              style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87), // Style
            ), // End description
            const SizedBox(height: 20), // Spacing
            const Text( // Ingredients title
              'Ingredients', // Title
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Style
            ), // End title
            const SizedBox(height: 8), // Spacing
            SizedBox( // Chip list container
              height: 40, // Height
              child: ListView.separated( // Horizontal list
                scrollDirection: Axis.horizontal, // Horizontal
                itemBuilder: (context, index) { // Build chip
                  final ingredient = burger.ingredients[index]; // Ingredient
                  return Chip( // Chip widget
                    label: Text(ingredient), // Chip text
                    backgroundColor: Colors.orange.shade50, // Chip background
                  ); // End chip
                }, // End itemBuilder
                separatorBuilder: (_, __) => const SizedBox(width: 8), // Spacing
                itemCount: burger.ingredients.length, // Count
              ), // End list
            ), // End sized box
            const SizedBox(height: 24), // Spacing
            _AddToCartButton(), // Add to cart button
          ], // End children
        ), // End list view
      ), // End slide transition
    ); // End scaffold
  } // End build
} // End state

class _AddToCartButton extends StatelessWidget { // Add to cart button
  @override
  Widget build(BuildContext context) { // Build
    return SizedBox( // Full width
      width: double.infinity, // Full width
      child: ElevatedButton( // Button
        onPressed: () { // Tap handler
          ScaffoldMessenger.of(context).showSnackBar( // Show snackbar
            const SnackBar(content: Text('Added to cart!')), // Message
          ); // End snackbar
        }, // End onPressed
        style: ElevatedButton.styleFrom( // Style
          padding: const EdgeInsets.symmetric(vertical: 16), // Height
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Rounded
          elevation: 0, // Flat
        ).copyWith( // Add gradient background
          backgroundColor: MaterialStateProperty.all(Colors.transparent), // Transparent
          shadowColor: MaterialStateProperty.all(Colors.transparent), // No shadow
        ), // End copyWith
        child: Ink( // Ink for gradient
          decoration: BoxDecoration( // Decoration
            gradient: const LinearGradient( // Gradient
              colors: [Color(0xFFFF8A00), Color(0xFFFF5E00)], // Orange gradient
            ), // End gradient
            borderRadius: BorderRadius.circular(16), // Rounded
          ), // End decoration
          child: Container( // Inner container
            alignment: Alignment.center, // Center text
            padding: const EdgeInsets.symmetric(vertical: 16), // Padding
            child: const Text( // Button text
              'Add to Cart', // Label
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16), // Style
            ), // End text
          ), // End container
        ), // End ink
      ), // End button
    ); // End sized box
  } // End build
} // End _AddToCartButton
