import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      const Movie(
        id: "m1",
        name: "Haunted Heists 2026",
        description: "A scary movie about robbing a haunted house",
        ageRating: "PG",
        price: 10.99,
        imagePath: "assets/images/oip.jpg",
        screeningTime: "Thursday 22 Oct 2026 18:00",
      ),
      const Movie(
        id: "m2",
        name: "White Chicks",
        description: "Two agents going undercover as white women",
        ageRating: "PG",
        price: 10.99,
        imagePath: "assets/images/white_chicks.jpg",
        screeningTime: "Friday 23 Oct 2026 20:00",
      ),
      const Movie(
        id: "m3",
        name: "The Phantom of the Opera",
        description: "A classic horror film.",
        ageRating: "PG",
        price: 12.99,
        imagePath: "assets/images/phantom.jpg",
        screeningTime: "Sunday 4 Oct 2026 15:00",
      )
    ];
  }

  Movie? getMovieByID(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }
}
