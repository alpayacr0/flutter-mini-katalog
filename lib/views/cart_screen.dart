import 'package:mini_katalog/components/empty_card.dart';
import 'package:mini_katalog/components/mini_card_tile.dart';
import 'package:mini_katalog/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:mini_katalog/views/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  final List<Data> allProducts;
  final Set<int> cardIds;

  const CartScreen({
    super.key,
    required this.allProducts,
    required this.cardIds,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = widget.allProducts
        .where((product) => widget.cardIds.contains(product.id))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Cart"), backgroundColor: Colors.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: cartProducts.isEmpty
                    ? const EmptyCard()
                    : ListView.builder(
                        itemCount: cartProducts.length,
                        itemBuilder: (context, index) {
                          final product = cartProducts[index];
                          return MiniCardTile(
                            name: product.name!,
                            tagline: product.tagline!,
                            price: product.price!,
                            imageUrl: product.image!,
                            onRemove: () {
                              setState(() {
                                widget.cardIds.remove(product.id);
                              });
                            },
                          );
                        },
                      ),
              ),

              SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: Colors.grey.shade600),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam pulvinar leo quis eros blandit euismod.",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                onPressed: cartProducts.isEmpty
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CheckoutScreen(cardIds: widget.cardIds),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Checkout", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
