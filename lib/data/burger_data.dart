import '../models/burger.dart'; // Import Burger model

final Map<String, Burger> burgerData = { // Hardcoded burger map
  'BURGER_001': const Burger( // Burger 1 entry
    id: 'BURGER_001', // Burger ID
    name: 'Classic Smash Burger', // Burger name
    description: 'Juicy smashed beef patty with pickles, onions, and a soft brioche bun.', // Description
    price: 8.99, // Price
    imageUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349', // Unsplash image
    ingredients: ['Beef', 'Cheddar', 'Pickles', 'Onion', 'Brioche'], // Ingredients
    calories: 620, // Calories
  ), // End burger 1
  'BURGER_002': const Burger( // Burger 2 entry
    id: 'BURGER_002', // Burger ID
    name: 'BBQ Bacon Stack', // Burger name
    description: 'Smoky BBQ sauce, crispy bacon, and melty cheddar stacked high.', // Description
    price: 11.49, // Price
    imageUrl: 'https://images.unsplash.com/photo-1550317138-10000687a72b', // Unsplash image
    ingredients: ['Beef', 'Bacon', 'BBQ Sauce', 'Cheddar', 'Lettuce'], // Ingredients
    calories: 760, // Calories
  ), // End burger 2
  'BURGER_003': const Burger( // Burger 3 entry
    id: 'BURGER_003', // Burger ID
    name: 'Mushroom Swiss Melt', // Burger name
    description: 'Sautéed mushrooms, Swiss cheese, and garlic aioli on a toasted bun.', // Description
    price: 10.99, // Price
    imageUrl: 'https://images.unsplash.com/photo-1508736793122-f516e3ba5569', // Unsplash image
    ingredients: ['Beef', 'Swiss', 'Mushrooms', 'Aioli'], // Ingredients
    calories: 690, // Calories
  ), // End burger 3
  'BURGER_004': const Burger( // Burger 4 entry
    id: 'BURGER_004', // Burger ID
    name: 'Spicy Jalapeño Crunch', // Burger name
    description: 'Spicy jalapeños, pepper jack, and crunchy onions with chipotle mayo.', // Description
    price: 9.49, // Price
    imageUrl: 'https://images.unsplash.com/photo-1550317138-10000687a72b?auto=format&fit=crop&w=1200&q=80', // Unsplash image
    ingredients: ['Beef', 'Jalapeño', 'Pepper Jack', 'Onion Crunch'], // Ingredients
    calories: 710, // Calories
  ), // End burger 4
  'BURGER_005': const Burger( // Burger 5 entry
    id: 'BURGER_005', // Burger ID
    name: 'Double Cheese Royale', // Burger name
    description: 'Two beef patties, double cheese, secret sauce, and fresh lettuce.', // Description
    price: 12.99, // Price
    imageUrl: 'https://images.unsplash.com/photo-1484723091739-30a097e8f929', // Unsplash image
    ingredients: ['Beef x2', 'Cheddar', 'Secret Sauce', 'Lettuce'], // Ingredients
    calories: 890, // Calories
  ), // End burger 5
}; // End map
