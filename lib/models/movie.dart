class Movie {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final String screeningTime;

  const Movie(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imagePath,
      required this.screeningTime});

  String get formattedPrice => "£${price.toStringAsFixed(2)}";
}
