import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Restaurant Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> categories = [
    'Appetizers',
    'Main Course',
    'Desserts',
    'Drinks'
  ];
  final List<Map<String, dynamic>> foodItems = [
    {
      'image': 'assets/burger.png',
      'name': 'Burger',
      'price': 1500.0,
      'rating': 4.5
    },
    {
      'image': 'assets/pizza.png',
      'name': 'Pizza',
      'price': 2500.0,
      'rating': 4.8
    },
    {'image': 'assets/rice.png', 'name': 'Rice', 'price': 500.0, 'rating': 5.0},
    {'image': 'assets/ramen.png', 'name': 'Ramen', 'price': 700.0, 'rating': 4.0},
    {
      'image': 'assets/spaghetti.png',
      'name': 'Spaghetti',
      'price': 700.0,
      'rating': 3.0
    },
    {
      'image': 'assets/smoothie.png',
      'name': 'Smoothie',
      'price': 700.0,
      'rating': 5.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Chip(label: Text(categories[index])),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return FoodItemCard(
                  imageUrl: foodItems[index]['image'],
                  name: foodItems[index]['name'],
                  price: foodItems[index]['price'],
                  rating: foodItems[index]['rating'],
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final double rating;

  const FoodItemCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text('\$${price.toStringAsFixed(2)}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              Text(rating.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
