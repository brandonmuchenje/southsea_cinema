import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      const Movie(
        id: 'm1',
        name: 'Haunted Heists 2026',
        description: 'A scary movie about robbing a haunted house',
        ageRating: 'PG',
        price: 10.99,
        imagePath: 'assets/images/oip.jpg',
        screeningTime: 'Thursday 22 Oct 2026 18:00',
      ),
      const Movie(
        id: 'm2',
        name: 'White Chicks',
        description: 'Two agents going undercover as white women',
        ageRating: 'PG',
        price: 10.99,
        imagePath: 'assets/images/white_chicks.jpg',
        screeningTime: 'Friday 23 Oct 2026 20:00',
      ),
      const Movie(
        id: 'm3',
        name: 'Shrek',
        description:
            'An ogre sets out on an adventure to rescue Princess Fiona with the help of Donkey',
        ageRating: 'PG',
        price: 10.99,
        imagePath: 'assets/images/shrek.jpg',
        screeningTime: 'Sunday 4 Oct 2026 15:00',
      ),
      const Movie(
        id: 'm4',
        name: 'Sharknado',
        description:
            'A deadly tornado filled with sharks threatens Los Angeles.',
        ageRating: '15',
        price: 10.99,
        imagePath: 'assets/images/sharknado.jpg',
        screeningTime: 'Saturday 24 Oct 2026 20:00',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }
}