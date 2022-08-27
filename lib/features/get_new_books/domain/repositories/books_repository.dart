import 'package:dartz/dartz.dart';
import 'package:flutter_book_app/features/get_new_books/data/models/new_books_model.dart';

import '../../../core/error/Failures.dart';

abstract class BooksRepository {
  Future<Either<Failure, NewBooksModel>> getNewBooks();
}