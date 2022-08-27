import 'package:hive/hive.dart';

part 'books_cache_entity.g.dart';

@HiveType(typeId: 2)
class BooksCacheEntity extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subtitle;
  @HiveField(2)
  final String isbn13;
  @HiveField(3)
  final String price;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final String url;

  BooksCacheEntity(
      {required this.title,
      required this.subtitle,
      required this.isbn13,
      required this.price,
      required this.image,
      required this.url});

}
