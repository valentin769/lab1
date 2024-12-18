import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clothing Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClothingListScreen(),
    );
  }
}

class ClothingItem {
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  ClothingItem({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class ClothingListScreen extends StatelessWidget {
  final List<ClothingItem> clothingItems = [
    ClothingItem(
      name: 'T-shirt',
      description: 'Comfortable cotton T-shirt',
      imageUrl: 'https://i5.walmartimages.com/asr/fd0b6aa1-967a-416c-9abb-51b68c6a8f0d_1.cf581c2b5c826220016b54c1551f4075.jpeg',
      price: 19.99,
    ),
    ClothingItem(
      name: 'Jeans',
      description: 'Stylish denim jeans',
      imageUrl: 'https://cdn.ecommercedns.uk/files/7/248567/0/17515000/a-pile-of-denim-jeans-in-different-shades-of-blue.jpg',
      price: 39.99,
    ),
    ClothingItem(
      name: 'Jacket',
      description: 'Warm winter jacket',
      imageUrl: 'https://www.mybargainbuddy.com/wp/wp-content/uploads/2017/12/mens-arctic-coat.jpg',
      price: 59.99,
    ),
    ClothingItem(
      name: 'Sneakers',
      description: 'Comfortable running shoes',
      imageUrl: 'https://cdn.luxe.digital/media/sites/7/2018/10/20110949/best-premium-leather-sneakers-men-paul-smith-luxury-style-luxe-digital.jpg',
      price: 49.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index: 212033'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClothingDetailScreen(item: item),
                ),
              );
            },
            child: Card(
              elevation: 5.0,
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.network(item.imageUrl, height: 120, width: 120),
                  Text(item.name),
                  Text('\$${item.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ClothingDetailScreen extends StatelessWidget {
  final ClothingItem item;

  ClothingDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(item.imageUrl),
            SizedBox(height: 20),
            Text(
              item.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              item.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '\$${item.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
