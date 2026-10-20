import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      const Movie(
        id: "m1",
        name: "Haunted Heists 2026",
        description: "A scary movie about robbing a haunted house",
        price: 10.99,
        imagePath: "assets/images/oip.jpg",
        screeningTime: "Thursday 22 Oct 2026 18:00",
      ),
      const Movie(
        id: "m2",
        name: "White Chicks",
        description: "Two agents going undercover as white women",
        price: 10.99,
        imagePath: "assets/images/white_chicks.jpg",  
        screeningTime: "Friday 23 Oct 2026 20:00",
      ),
    ];
  }
}
