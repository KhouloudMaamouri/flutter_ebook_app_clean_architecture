import 'package:flutter_book_app/features/get_new_books/data/data_sources/local/books_repository.dart';
import 'package:flutter_book_app/features/get_new_books/data/data_sources/local/new_books_local_data_source.dart';
import 'package:flutter_book_app/features/get_new_books/data/data_sources/remote/get_new_books_remote_data_source.dart';
import 'package:flutter_book_app/features/get_new_books/domain/usecases/get_new_books.dart';
import 'package:flutter_book_app/features/get_new_books/presentation/bloc/new_books_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'features/core/plateform/network_info.dart';
import 'features/get_new_books/data/data_sources/local/books_repository_impl.dart';
import 'features/get_new_books/data/repositories/books_repository_impl.dart';
import 'features/get_new_books/domain/repositories/books_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! features - Get new books
// Bloc
  sl.registerFactory<NewBooksBloc>(
      () => NewBooksBloc(getNewBooks: sl<GetBooks>()));

  // repository
  sl.registerLazySingleton<BooksRepository>(() => BooksRepositoryImpl(
      localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<NewBooksRepository>(() => NewBooksRepositoryImpl());


  // Data sources
  sl.registerLazySingleton<GetNewBooksRemoteDataSource>(
    () => GetNewBooksRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<NewBooksLocalDataSource>(
        () => NewBooksLocalDataSourceImpl(repository: sl<NewBooksRepository>()),
  );

  // useCases
  sl.registerLazySingleton<GetBooks>(
      () => GetBooks(repository: sl<BooksRepository>()));

//! External
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl<InternetConnectionChecker>()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Logger(
    printer: PrettyPrinter(
        colors: true,
        printEmojis: true
    ),
  ));
}
