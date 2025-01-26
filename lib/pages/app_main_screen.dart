import 'package:flutter/material.dart';

class CoffeeAppMainScreen extends StatefulWidget {
  const CoffeeAppMainScreen({super.key});

  @override
  State<CoffeeAppMainScreen> createState() => _CoffeeAppMainScreenState();
}

class _CoffeeAppMainScreenState extends State<CoffeeAppMainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background putih setengah bawah
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(color: Colors.black),
                ),
                Expanded(
                  child: Container(color: Colors.white),
                ),
              ],
            ),
          ),
          // Konten utama
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Location',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            'Bilzen, Tanjungbalai',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Icon(Icons.notifications, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Search bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Search coffee',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.filter_list, color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Promo banner
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/coffee-shop/promo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Promo',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text(
                            'Buy one get one FREE',
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Categories
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryButton(title: 'All Coffee', isSelected: true),
                      CategoryButton(title: 'Macchiato'),
                      CategoryButton(title: 'Latte'),
                      CategoryButton(title: 'Americano'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Coffee list
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: 4, // Sesuaikan dengan jumlah gambar Anda
                      itemBuilder: (context, index) {
                        // Daftar gambar spesifik untuk setiap item
                        final List<Map<String, dynamic>> coffeeData = [
                          {
                            'title': 'Caffe Mocha',
                            'subtitle': 'Deep Foam',
                            'price': 4.53,
                            'imageUrl': 'assets/coffee-shop/caffe_mocha.png', // Gambar lokal
                          },
                          {
                            'title': 'Flat White',
                            'subtitle': 'Espresso',
                            'price': 3.53,
                            'imageUrl': 'assets/coffee-shop/flat_white.jpg', // Gambar lokal
                          },
                          {
                            'title': 'Latte',
                            'subtitle': 'Creamy Milk',
                            'price': 5.00,
                            'imageUrl': 'assets/coffee-shop/coffee_3.jpg', // Gambar lokal
                          },
                          {
                            'title': 'Americano',
                            'subtitle': 'Black Coffee',
                            'price': 3.00,
                            'imageUrl': 'assets/coffee-shop/coffee_4.jpg', // Gambar lokal
                          },
                        ];

                        // Menentukan data untuk item saat ini berdasarkan index
                        final coffee = coffeeData[index % coffeeData.length];

                        return CoffeeCard(
                          title: coffee['title'] as String,
                          subtitle: coffee['subtitle'] as String,
                          price: coffee['price'] as double,
                          imageUrl: coffee['imageUrl'] as String, // Menggunakan path lokal
                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.brown),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.brown),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.brown),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryButton({required this.title, this.isSelected = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.brown : Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[400],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double price;
  final String imageUrl;

  const CoffeeCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
