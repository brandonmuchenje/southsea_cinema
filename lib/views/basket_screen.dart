import 'package:flutter/material.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final basket = BasketRepository.instance;
    final items = basket.getItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Basket'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            title: Text(item.movie.name),
            subtitle: Text(
              '${item.quantity} ticket(s)',
            ),
            trailing: Text(
              '£${item.lineTotal.toStringAsFixed(2)}',
            ),
          );
        },
      ),
    );
  }
}