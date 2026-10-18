import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      const Movie(
        id: "m1",
        name: "Haunted Heists 2026 ",
        description: "a scary movie about robbong a haunted house",
        price: 10.99,
        imagePath: "assets/images/oip.jpg",
      ),
      const Movie(
        id: "m2", 
        name: "White Chicks", 
        description: "Two agnets going undercover as white wome", 
        price: 10.99,
        imagePath: "assets/images/white_chicks.jpg",
        )

      
    ];
  }
}
