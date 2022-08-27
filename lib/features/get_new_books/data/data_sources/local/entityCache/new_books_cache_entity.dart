import 'package:flutter_book_app/features/get_new_books/data/data_sources/local/entityCache/books_cache_entity.dart';
import 'package:hive/hive.dart';

part 'new_books_cache_entity.g.dart';

@HiveType(typeId: 1)
class NewBooksCacheEntity extends HiveObject {

  @HiveField(0)
  final String total;
  @HiveField(1)
  final List<BooksCacheEntity> books;

  NewBooksCacheEntity({
    required this.total,
    required this.books
  });

}