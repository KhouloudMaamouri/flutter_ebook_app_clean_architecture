import 'package:dartz/dartz.dart';
import 'package:flutter_book_app/features/core/error/Failures.dart';
import 'package:flutter_book_app/features/core/usecases/usecase.dart';
import '../../data/models/new_books_model.dart';
import '../repositories/books_repository.dart';

class GetBooks implements UseCase<NewBooksModel, NoParams> {

  final BooksRepository repository;

  GetBooks({required this.repository});

  @override
  Future<Either<Failure, NewBooksModel>> call(NoParams params) async {
    return await repository.getNewBooks();
  }
}