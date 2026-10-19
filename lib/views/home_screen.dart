import 'package:mini_katalog/components/product_card_tile.dart';
import 'package:mini_katalog/models/products_model.dart';
import 'package:mini_katalog/services/api_service.dart';
import 'package:mini_katalog/services/local_storage_service.dart';
import 'package:mini_katalog/views/cart_screen.dart';
import 'package:mini_katalog/views/product_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocalStorageService lsServices = LocalStorageService();
  ApiService apiService = ApiService();
  List<Data> allProducts = [];
  bool isLoading = false;
  String errorMessage = "";
  String searchQuery = "";
  final Set<int> cardIds = {};

  List<Data> get filteredProducts {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) {
      return allProducts;
    }

    return allProducts.where((product) {
      final name = (product.name ?? "").toLowerCase();
      return name.contains(query);
    }).toList();
  }

  Future<void> loadProducts() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = "";
      });
      final products = await apiService.fetchProducts();
      setState(() {
        allProducts = products.data ?? [];
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  String name = "";
  String surname = "";

  Future<void> getUserData() async {
    final userData = await lsServices.getUserData();
    setState(() {
      name = userData['name'] ?? "";
      surname = userData['surname'] ?? "";
    });
  }

  @override
  void initState() {
    getUserData();
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsToShow = filteredProducts;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discovery",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.0,
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(
                                allProducts: allProducts,
                                cardIds: cardIds,
                              ),
                            ),
                          );

                          if (!mounted) return;
                          setState(() {});
                        },
                        iconSize: 32,
                        icon: const Icon(Icons.shopping_bag_outlined),
                      ),
                      if (cardIds.isNotEmpty)
                        Positioned(
                          right: 2,
                          top: 2,
                          child: Container(
                            constraints: const BoxConstraints(
                              minWidth: 18,
                              minHeight: 18,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                cardIds.length.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),

              Text(
                "Find your perfect device",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              SizedBox(height: 14),

              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search products",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),

              SizedBox(height: 16),

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://wantapi.com/assets/banner.png",
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),

              SizedBox(height: 16),

              Expanded(
                child: isLoading == true
                    ? const Center(child: CircularProgressIndicator())
                    : errorMessage.isNotEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Could not load products.",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              errorMessage,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: loadProducts,
                              child: const Text("Try again"),
                            ),
                          ],
                        ),
                      )
                    : productsToShow.isEmpty
                    ? Center(
                        child: Text(
                          "No products found for \"$searchQuery\"",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14,
                          ),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: productsToShow.length,
                        itemBuilder: (context, index) {
                          final product = productsToShow[index];
                          return GestureDetector(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                    cardIds: cardIds,
                                    findProduct: product,
                                  ),
                                ),
                              );

                              if (!mounted) return;
                              setState(() {});
                            },
                            child: ProductCardTile(product: product),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
