import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';


class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Card (
      margin: EdgeInsets.symmetric(horizontal:16.0, vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image.asset("assets/OIP.jpg")
            
          ],
         ), 
          Image.asset(movie.imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          ),
          const SizedBox(width: 16,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text (
                  movie.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                 movie.description,
                 style: const TextStyle(color: Colors.white), 
                ),
              ],
            )
            ),
        ],
      ),

      ),
    );
  }
}