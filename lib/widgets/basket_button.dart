import 'package:flutter/material.dart';


class BasketButton extends StatelessWidget {
  const BasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.shopping_basket),
      tooltip: 'My Basket',
      onPressed: () {
        Navigator.pushNamed(context, '/basket');
      },
    );
  }
}