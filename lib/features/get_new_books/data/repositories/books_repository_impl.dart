import 'package:dartz/dartz.dart';
import 'package:flutter_book_app/features/core/error/Failures.dart';
import 'package:flutter_book_app/features/get_new_books/data/models/new_books_model.dart';
import 'package:flutter_book_app/features/get_new_books/domain/repositories/books_repository.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/plateform/network_info.dart';
import '../data_sources/local/new_books_local_data_source.dart';
import '../data_sources/remote/get_new_books_remote_data_source.dart';

typedef Future<NewBooksModel> _BooksChooser();


class BooksRepositoryImpl extends BooksRepository {

  final NewBooksLocalDataSource localDataSource;
  final GetNewBooksRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BooksRepositoryImpl(
      {required this.localDataSource,
        required this.remoteDataSource,
        required this.networkInfo});


  @override
  Future<Either<Failure, NewBooksModel>> getNewBooks() async {
    return await _getNewBooks(() => remoteDataSource.getNewBooks());
  }

  Future<Either<Failure, NewBooksModel>> _getNewBooks(
      _BooksChooser booksChooser) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteBooks = await booksChooser();
        localDataSource.cacheNewBooks(remoteBooks);
        return Right(remoteBooks);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localBooks = await localDataSource.getCachedBooks();
        return Right(localBooks);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

}