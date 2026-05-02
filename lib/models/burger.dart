class Burger { // Burger data model
  final String id; // Unique QR ID
  final String name; // Burger name
  final String description; // Burger description
  final double price; // Burger price
  final String imageUrl; // Burger image URL
  final List<String> ingredients; // Ingredients list
  final int calories; // Calories count

  const Burger({ // Constructor
    required this.id, // Required id
    required this.name, // Required name
    required this.description, // Required description
    required this.price, // Required price
    required this.imageUrl, // Required image URL
    required this.ingredients, // Required ingredients
    required this.calories, // Required calories
  }); // End constructor
} // End Burger
