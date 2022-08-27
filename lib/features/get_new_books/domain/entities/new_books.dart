
import 'package:equatable/equatable.dart';
import '../../data/models/books_model.dart';
import 'books.dart';

class NewBooks extends Equatable {

  final String error;
  final String total;
  final List<BooksModel> books;

  NewBooks({
    required this.error,
    required this.total,
    required this.books
  });

  @override
  List<Object?> get props => [error, total, books];

}