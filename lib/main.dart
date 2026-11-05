import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/menu_screen.dart';


void main() {
  runApp(const SouthseaCinemaApp());
}

class SouthseaCinemaApp extends StatelessWidget {
  const SouthseaCinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: cinemaBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: cinemaBrand,
          primary: cinemaBrand,
          surface: cinemaSurface,
        ),
        appBarTheme:  AppBarTheme(
          backgroundColor: cinemaSurface,
          iconTheme: IconThemeData(
            color:  cinemaBrand,
          ),
          titleTextStyle: cinemaHeaderStyle,
          elevation: 0,
        )
      ),
      home: const MenuScreen(),
    );
  }
}
