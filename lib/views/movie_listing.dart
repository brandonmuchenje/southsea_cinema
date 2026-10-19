import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              widget.movie.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),

            const Text("Southsea cinema"),
            const SizedBox(height: 20),

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

            ElevatedButton(
              onPressed: () {
                if (_ticketQuantity > 0) {
                  final totalPrice = widget.movie.price * _ticketQuantity;
                  setState(() {
                    feedback =
                        '$_ticketQuantity ticket(s) added (£${totalPrice.toStringAsFixed(2)})';
                  });
                } else {
                  setState(() {
                    feedback = 'Please select at least 1 ticket';
                  });
                }
              },
              child: const Text('add'),
            ),

            const SizedBox(height: 20),
            Text(feedback),
          ],
        ),
      ),
    );
  }
}
