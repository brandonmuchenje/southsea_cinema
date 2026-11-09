import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({
    super.key,
    required this.movie,
  });

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 0;
  String feedback = '';

  void _addToBasket() {
    if (_ticketQuantity > 0) {
      final TicketItem item = TicketItem(
        movie: widget.movie,
        quantity: _ticketQuantity,
      );

      BasketRepository.instance.addItem(item);

      setState(() {
        feedback =
            'Added $_ticketQuantity ticket(s) for ${widget.movie.name} to basket';
      });
    } else {
      setState(() {
        feedback = 'Please select at least 1 ticket';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        actions: const [
          BasketButton(),
        ],
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.movie.imagePath,
              width: 200,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("Southsea Cinema"),
                  const Text("Southsea cinema"),
                  const SizedBox(height: 10),
                  Text(widget.movie.screeningTime),
                  const SizedBox(height: 10),
                  const Text(
                    "Please note that discounts/ Membership Benefits will be applied once you have selected your tickets",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  DropdownMenu<int>(
                    initialSelection: 0,
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: 0, label: '0 tickets'),
                      DropdownMenuEntry(value: 1, label: '1 Ticket'),
                      DropdownMenuEntry(value: 2, label: '2 Tickets'),
                      DropdownMenuEntry(value: 3, label: '3 Tickets'),
                      DropdownMenuEntry(value: 4, label: '4 Tickets'),
                      DropdownMenuEntry(value: 5, label: '5 Tickets'),
                    ],
                    onSelected: (value) {
                      setState(() {
                        _ticketQuantity = value ?? 0;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    label: 'Add to Basket',
                    onPressed: _addToBasket,
                  ),
                  const SizedBox(height: 20),
                  Text(feedback),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
