import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() {
    return _BasketScreenState();
  }
}

class _BasketScreenState extends State<BasketScreen> {
  String confirmationMessage = '';

  Widget _buildEmptyState() {
    return const Center(
      child: Text(
        'Your basket is empty',
      ),
    );
  }

  Widget _buildLineItem(
    TicketItem item,
    int index,
  ) {
    return ListTile(
      title: Text(
        item.movie.name,
      ),
      subtitle: Text(
        '${item.quantity} ticket(s)',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '£${item.lineTotal.toStringAsFixed(2)}',
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              setState(() {
                BasketRepository.instance.removeItem(index);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBasketList(
    BasketRepository basket,
    List<TicketItem> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Basket',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        for (int index = 0; index < items.length; index++)
          _buildLineItem(items [index],index),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total Tickets',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              basket.getTotalTickets().toString(),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total Cost',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '£${basket.getTotalCost().toStringAsFixed(2)}',
            ),
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                basket.clear();
                confirmationMessage =
                    'Thanks, your booking has been confirmed';
              });
            },
            child: const Text(
              'Checkout',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final basket = BasketRepository.instance;
    final items = basket.getItems();

    final Widget content;

    if (items.isEmpty) {
      if (confirmationMessage.isNotEmpty) {
        content = Column(
          children: [
            _buildEmptyState(),
            Text(
              confirmationMessage,
            ),
          ],
        );
      } else {
        content = _buildEmptyState();
      }
    } else {
      content = _buildBasketList(
        basket,
        items,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Basket',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: content,
      ),
    );
  }
}