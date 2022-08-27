import 'package:flutter_book_app/features/get_new_books/data/data_sources/local/books_repository.dart';
import 'package:flutter_book_app/features/get_new_books/data/data_sources/local/entityCache/new_books_cache_entity.dart';
import 'package:hive/hive.dart';

import '../../../../core/box_names.dart';
import '../../../domain/entities/books.dart';
import '../../models/books_model.dart';
import '../../models/new_books_model.dart';
import 'entityCache/books_cache_entity.dart';

class NewBooksRepositoryImpl implements NewBooksRepository {


  @override
  Future<NewBooksModel> get() async {
    final newBooksBox = await Hive.box(NEW_BOOKS) as NewBooksCacheEntity;
    final mNewBooksModel =
        NewBooksModel(error:"0", total: newBooksBox.total, books: mapToBooks(newBooksBox.books));

    return mNewBooksModel;
  }

  List<BooksModel> mapToBooks(List<BooksCacheEntity> mBooksCacheEntity) {
    List<BooksModel> mBooks = List.empty();

    mBooksCacheEntity.forEach((element) {
      final book = BooksModel(
          title: element.title,
          subtitle: element.subtitle,
          isbn13: element.isbn13,
          price: element.price,
          image: element.image,
          url: element.url);
      mBooks.add(book);
    });

    return mBooks;
  }

  @override
  Future<void> insert(NewBooksModel books) async {
    final box = await Hive.openBox(NEW_BOOKS);
    box.put('total', books.total);

    books.books.forEach((element) {
      box.put('url', element.url);
      box.put('image', element.image);
      box.put('price', element.price);
      box.put('isbn13', element.isbn13);
      box.put('title', element.title);
      box.put('subtitle', element.subtitle);
    });
  }
}
