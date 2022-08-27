import 'package:flutter_book_app/features/get_new_books/data/data_sources/local/books_repository.dart';
import 'package:flutter_book_app/features/get_new_books/data/models/new_books_model.dart';

import '../../../../core/error/exceptions.dart';

abstract class NewBooksLocalDataSource {
  Future<NewBooksModel> getCachedBooks();

  Future<void> cacheNewBooks(NewBooksModel booksToCache);
}

class NewBooksLocalDataSourceImpl implements NewBooksLocalDataSource {
  final NewBooksRepository repository;

  NewBooksLocalDataSourceImpl({required this.repository});

  @override
  Future<void> cacheNewBooks(NewBooksModel booksToCache) async {
    repository.insert(booksToCache);
  }

  @override
  Future<NewBooksModel> getCachedBooks() {
    final cachedBooks = repository.get();
    if (cachedBooks != null) {
      return Future.value(cachedBooks);
    } else {
      throw CacheException();
    }
  }
}
