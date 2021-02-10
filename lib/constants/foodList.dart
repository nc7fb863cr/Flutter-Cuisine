Map<String, Map> foodList = {
  "cake": {
    "name": "Cake",
    "key": "cake",
    "url": "assets/vanilla cake.jpg",
    "price": 580,
    "calorie": 305,
    "protein": 5.0,
    "carb": 74.0,
    "type": "Dessert"
  },
  "multigrain bread": {
    "name": "Multigrain Bread",
    "key": "multigrain bread",
    "url": "assets/bread.jpg",
    "price": 80,
    "calorie": 65,
    "protein": 2.6,
    "carb": 12.0,
    "type": "Bread"
  },
  "dumplings": {
    "name": "Dumplings",
    "key": "dumplings",
    "url": "assets/dumplings.jpg",
    "price": 85,
    "calorie": 162,
    "protein": 3.5,
    "carb": 24.5,
    "type": "Chinese"
  },
  "hamburger": {
    "name": "Hamburger",
    "key": "hamburger",
    "url": "assets/hamburger.jpg",
    "price": 95,
    "calorie": 294,
    "protein": 17.0,
    "carb": 24.0,
    "type": "American"
  },
  "macaron": {
    "name": "Macaron",
    "key": "macaron",
    "url": "assets/macaron.jpg",
    "price": 120,
    "calorie": 403,
    "protein": 3.6,
    "carb": 72.0,
    "type": "Dessert"
  },
  "pizza": {
    "name": "Pizza",
    "key": "pizza",
    "url": "assets/pizza.jpg",
    "price": 285,
    "calorie": 266,
    "protein": 11.0,
    "carb": 33.0,
    "type": "Italian"
  },
  "salad": {
    "name": "Salad",
    "key": "salad",
    "url": "assets/salad.jpg",
    "price": 120,
    "calorie": 44,
    "protein": 3.2,
    "carb": 4.3,
    "type": "Appetizer"
  },
  "spaghetti": {
    "name": "Spaghetti",
    "key": "spaghetti",
    "url": "assets/spaghetti.jpg",
    "price": 220,
    "calorie": 157,
    "protein": 6.0,
    "carb": 31.0,
    "type": "Italian"
  },
  "steak": {
    "name": "Steak",
    "key": "steak",
    "url": "assets/steak.jpg",
    "price": 260,
    "calorie": 270,
    "protein": 25.0,
    "carb": 0.0,
    "type": "American"
  },
  "sushi": {
    "name": "Sushi",
    "key": "sushi",
    "url": "assets/sushi.jpg",
    "price": 130,
    "calorie": 140,
    "protein": 2.0,
    "carb": 28.0,
    "type": "Japanese"
  }
};

List typeList =
    foodList.keys.map((item) => foodList[item]['type']).toSet().toList();
