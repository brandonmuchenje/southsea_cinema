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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Haunted Heist 2026 (PG)"),
          Text("Southsea cinema"),
          Text("Thursday 22 Oct 2026 18:00 end 19:14"),
          Text(
              "Olease note that discounts/ Membership Benefits will be applied once you have seleceted your tickets")
        ],
      )),
    );
  }
}
