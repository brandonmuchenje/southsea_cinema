import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      Movie(
        id: "Haunted Heist",
        name: "Haunted Heists 2026 ",
        description: "a scary movie about robbong a haunted house"
        price: 10.99,
        imagePath : "assets/images/oip.jpg"

      ),
    ];
  }
}
