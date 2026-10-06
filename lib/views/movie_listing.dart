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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment. start,
        children: const [
          Text(
            "Haunted Heist 2026 (PG)",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          
          SizedBox(height: 10),
          Text("Southsea cinema"),
          SizedBox(height: 20),
          Text("Thursday 22 Oct 2026 18:00 end 19:14"),
          Text(
              "Please note that discounts/ Membership Benefits will be applied once you have seleceted your tickets")
          DropdownMenu<int>(
            initialSelection: 0,
          ),    
        ],
      )),
    );
  }
}
