import 'package:cached_network_image/cached_network_image.dart'; // Cached image
import 'package:flutter/material.dart'; // Flutter UI
import '../models/burger.dart'; // Burger model

class BurgerCard extends StatelessWidget { // Burger card widget
  final Burger burger; // Burger data
  final VoidCallback onTap; // Tap callback

  const BurgerCard({ // Constructor
    super.key, // Key
    required this.burger, // Burger
    required this.onTap, // Tap
  }); // End constructor

  @override
  Widget build(BuildContext context) { // Build
    return InkWell( // Tap wrapper
      onTap: onTap, // Handle tap
      borderRadius: BorderRadius.circular(16), // Rounded splash
      child: Container( // Card container
        decoration: BoxDecoration( // Decoration
          color: Colors.white, // White background
          borderRadius: BorderRadius.circular(16), // Rounded corners
          boxShadow: [ // Subtle shadow
            BoxShadow( // Shadow
              color: Colors.black.withOpacity(0.08), // Shadow color
              blurRadius: 10, // Blur
              offset: const Offset(0, 4), // Offset
            ), // End shadow
          ], // End shadows
        ), // End decoration
        child: Row( // Row layout
          children: [ // Row children
            Hero( // Hero animation
              tag: burger.id, // Tag
              child: ClipRRect( // Rounded image
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)), // Left rounding
                child: CachedNetworkImage( // Image
                  imageUrl: burger.imageUrl, // URL
                  width: 110, // Width
                  height: 90, // Height
                  fit: BoxFit.cover, // Cover
                ), // End image
              ), // End clip
            ), // End hero
            const SizedBox(width: 12), // Spacing
            Expanded( // Expand text
              child: Column( // Column
                crossAxisAlignment: CrossAxisAlignment.start, // Align left
                children: [ // Children
                  Text( // Name
                    burger.name, // Name
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), // Style
                  ), // End text
                  const SizedBox(height: 4), // Spacing
                  Text( // Price
                    '\$${burger.price.toStringAsFixed(2)}', // Price
                    style: TextStyle(color: Colors.green.shade700, fontWeight: FontWeight.w600), // Style
                  ), // End text
                ], // End children
              ), // End column
            ), // End expanded
            const SizedBox(width: 12), // Right padding
          ], // End row children
        ), // End row
      ), // End container
    ); // End InkWell
  } // End build
} // End BurgerCard
