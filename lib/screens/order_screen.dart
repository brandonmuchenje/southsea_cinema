import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';

class OrderScreen extends StatefulWidget {
  final Movie movie;
  final int maxTickets;

  const OrderScreen({super.key, required this.movie, this.maxTickets = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _ticket = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order ${widget.movie.name}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.movie.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            Text('Price per ticket: £${widget.movie.price.toStringAsFixed(2)}'),
            const SizedBox(height: 20),

            Row (
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                    onPressed: _ticket > 1
                      ? () => setState(() => _ticket--)
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 20,),

            Text(
              'Total: £${(widget.movie.price * _ticket).toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
