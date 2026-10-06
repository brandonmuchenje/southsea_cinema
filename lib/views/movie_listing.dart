import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _totalPrice = 0;
  String feedback = '';

  void _decreaseQuantity() {
    setState(() {
      if (_totalPrice > 0) {
        _totalPrice--;
      }
      feedback = 'removed from order';
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Haunted Heist 2026 (PG)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text("Southsea cinema"),
            const SizedBox(height: 20),
            const Text("Thursday 22 Oct 2026 18:00 end 19:14"),
            const Text(
              "Please note that discounts/ Membership Benefits will be applied once you have seleceted your tickets",
            ),
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
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _totalPrice = value;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.lightBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        feedback = 'added to order';
                      });
                    },
                    child: const Text('add'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _decreaseQuantity,
                    child: const Text('remove'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(feedback),
          ],
        ),
      ),
    );
  }
}
