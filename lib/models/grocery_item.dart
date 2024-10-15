class GroceryItem {
  final int? id;
  final String name;
  final String description;
  final double price;
  final int? discount;
  final String imagePath;

  GroceryItem({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    this.discount,
    required this.imagePath,
  });
}

var demoItems = [
  GroceryItem(
      id: 1,
      name: "Organic Bananas",
      description: "7pcs, Priceg",
      price: 40,
      imagePath: "assets/images/grocery_images/banana.png",
      discount: 20),
  GroceryItem(
      id: 2,
      name: "Red Apple",
      description: "1kg, Priceg",
      price: 160,
      imagePath: "assets/images/grocery_images/apple.png",
      discount: 0),
  GroceryItem(
      id: 3,
      name: "Onion",
      description: "1kg, Priceg",
      price: 50,
      imagePath: "assets/images/grocery_images/onion.png",
      discount: 0),
  GroceryItem(
      id: 4,
      name: "Ginger",
      description: "250gm, Priceg",
      price: 60,
      imagePath: "assets/images/grocery_images/ginger.png",
      discount: 10),
  GroceryItem(
    id: 5,
    name: "Meat",
    description: "250gm, Priceg",
    price: 200,
    imagePath: "assets/images/grocery_images/beef.png",
    discount: 0,
  ),
  GroceryItem(
      id: 6,
      name: "Chikken",
      description: "250gm, Priceg",
      price: 100,
      discount: 0,
      imagePath: "assets/images/grocery_images/chicken.png"),
];

var exclusiveOffers = [demoItems[0], demoItems[1]];

var bestSelling = [demoItems[2], demoItems[3]];

var groceries = [demoItems[4], demoItems[5]];

var beverages = [
  GroceryItem(
      id: 7,
      name: "Dite Coke",
      description: "355ml, Price",
      price: 40,
      discount: 0,
      imagePath: "assets/images/beverages_images/diet_coke.png"),
  GroceryItem(
      id: 8,
      name: "Sprite Can",
      description: "325ml, Price",
      price: 40,
      discount: 0,
      imagePath: "assets/images/beverages_images/sprite.png"),
  GroceryItem(
      id: 8,
      name: "Apple Juice",
      description: "2L, Price",
      price: 100,
      discount: 0,
      imagePath: "assets/images/beverages_images/apple_and_grape_juice.png"),
  GroceryItem(
      id: 9,
      name: "Orange Juice",
      description: "2L, Price",
      price: 80,
      discount: 0,
      imagePath: "assets/images/beverages_images/orange_juice.png"),
  GroceryItem(
      id: 10,
      name: "Coca Cola Can",
      description: "325ml, Price",
      price: 30,
      discount: 0,
      imagePath: "assets/images/beverages_images/coca_cola.png"),
  GroceryItem(
      id: 11,
      name: "Pepsi Can",
      description: "330ml, Price",
      price: 40,
      discount: 0,
      imagePath: "assets/images/beverages_images/pepsi.png"),
];
