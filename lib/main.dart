import 'package:flutter/material.dart';

void main() {
  runApp(MyShopMini());
}

class MyShopMini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop Mini',
      debugShowCheckedModeBanner: false,

      // --------------------------
      // GLOBAL APP THEME
      // --------------------------
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xFFF4F1FF), // warna background lembut
        cardColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),

      home: HomeScreen(),
    );
  }
}

// -----------------------------------------------------------
// 1. HOME SCREEN
// -----------------------------------------------------------
class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"name": "Makanan", "icon": Icons.fastfood, "color": Colors.orange},
    {"name": "Minuman", "icon": Icons.local_drink, "color": Colors.lightBlue},
    {"name": "Elektronik", "icon": Icons.devices, "color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyShop Mini")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pilih Kategori",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 30),

          // ROW KATEGORI
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: categories.map((cat) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductListScreen(categoryName: cat["name"]),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  shadowColor: cat["color"],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: cat["color"].withOpacity(0.15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(cat["icon"], size: 36, color: cat["color"]),
                        SizedBox(height: 8),
                        Text(
                          cat["name"],
                          style: TextStyle(
                            color: cat["color"].shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------
// 2. PRODUCT LIST SCREEN
// -----------------------------------------------------------
class ProductListScreen extends StatelessWidget {
  final String categoryName;

  ProductListScreen({required this.categoryName});

  final List<Map<String, dynamic>> products = [
    {"name": "Produk A", "price": 10000, "icon": Icons.shopping_bag},
    {"name": "Produk B", "price": 15000, "icon": Icons.store_mall_directory},
    {"name": "Produk C", "price": 30000, "icon": Icons.card_giftcard},
    {"name": "Produk D", "price": 20000, "icon": Icons.shop_2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Daftar Produk",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),

          // GRID PRODUK
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(
                            name: product["name"],
                            price: product["price"],
                            icon: product["icon"],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shadowColor: Colors.deepPurple.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(product["icon"],
                                size: 45, color: Colors.deepPurple),
                            SizedBox(height: 10),
                            Text(
                              product["name"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple.shade700,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Rp ${product["price"]}",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------
// 3. PRODUCT DETAIL SCREEN
// -----------------------------------------------------------
class ProductDetailScreen extends StatelessWidget {
  final String name;
  final int price;
  final IconData icon;

  ProductDetailScreen({
    required this.name,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Produk")),
      body: Center(
        child: Card(
          elevation: 6,
          shadowColor: Colors.deepPurple.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Container(
            width: 260,
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 90, color: Colors.deepPurple),
                SizedBox(height: 20),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Rp $price",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
