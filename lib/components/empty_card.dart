import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12.0,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),

          Text(
            "Your cart is empty",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          Text(
            "Add items to your cart",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
