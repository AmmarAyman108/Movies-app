import 'package:hive/hive.dart';
part 'movie_entity.g.dart';
@HiveType(typeId: 0)
class MovieEntity {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final double rating;
  MovieEntity({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.rating,
  });
}
