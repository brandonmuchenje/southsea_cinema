import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

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
        decoration: BoxDecoration(
          color: const Color(0xFF2A2D36),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          " Haunted Heist (2026) – PG 12",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class HauntedHeistPage extends StatefulWidget {
  const HauntedHeistPage({super.key});

  @override
  State<HauntedHeistPage> createState() => _HauntedHeistPageState();
}

class _HauntedHeistPageState extends State<HauntedHeistPage> {
  int selectedTickets = 0;
  String feedback = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E2129),
        title: const Text(
          "Haunted Heist (2026)",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Southsea Cinema Room",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "Thursday 22 Oct 2026, 18:00 – ends at 19:14",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            const Text(
              "Please note that Discounts / Membership Benefits will be applied once you have selected your tickets.",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            const Text(
              "Select Quantities (Up to 5 in total)",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                DropdownButton<int>(
                  value: selectedTickets,
                  items: List.generate(
                    6,
                    (index) => DropdownMenuItem(
                      value: index,
                      child: Text("$index"),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedTickets = value!;
                    });
                  },
                ),
                const SizedBox(width: 10),
                const Text("Adult (£7.50)", style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  feedback = "Added $selectedTickets tickets to your order.";
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: const Text("ADD TO ORDER"),
            ),
            const SizedBox(height: 20),
            Text(
              feedback,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
