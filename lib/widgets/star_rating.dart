import 'package:flutter/material.dart'; // Flutter UI

class StarRating extends StatelessWidget { // Star rating widget
  final double rating; // Rating value

  const StarRating({ // Constructor
    super.key, // Key
    required this.rating, // Rating
  }); // End constructor

  @override
  Widget build(BuildContext context) { // Build
    final fullStars = rating.floor(); // Full stars
    final hasHalf = (rating - fullStars) >= 0.5; // Half star flag
    return Row( // Row of stars
      children: List.generate(5, (index) { // Generate 5 stars
        if (index < fullStars) { // Full star
          return const Icon(Icons.star, color: Colors.amber, size: 20); // Full icon
        } else if (index == fullStars && hasHalf) { // Half star
          return const Icon(Icons.star_half, color: Colors.amber, size: 20); // Half icon
        } else { // Empty star
          return const Icon(Icons.star_border, color: Colors.amber, size: 20); // Empty icon
        } // End if
      }), // End list
    ); // End row
  } // End build
} // End StarRating
