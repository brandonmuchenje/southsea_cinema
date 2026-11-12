class Movie {
  final String id;
  final String name;
  final String description;
  final String ageRating;
  final double price;
  final String imagePath;
  final String screeningTime;

  const Movie({
    required this.id,
    required this.name,
    required this.description,
    required this.ageRating,
    required this.price,
    required this.imagePath,
    required this.screeningTime,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      ageRating: json['ageRating'] as String,
      price: (json['price'] as num).toDouble(),
      imagePath: json['imagePath'] as String,
      screeningTime: json['screeningTime'] as String,
    );
  }

  String get formattedPrice => '£${price.toStringAsFixed(2)}';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'ageRating': ageRating,
      'price': price,
      'imagePath': imagePath,
      'screeningTime': screeningTime,
    };

    return data;
  }
}
