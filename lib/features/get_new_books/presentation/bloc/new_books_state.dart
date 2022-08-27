part of 'new_books_bloc.dart';

abstract class NewBooksState extends Equatable {
  const NewBooksState();
}

class Empty extends NewBooksState {
  @override
  List<Object> get props => [];
}

class Loading extends NewBooksState {
  @override
  List<Object> get props => [];
}

class Loaded extends NewBooksState {
  @override
  List<Object> get props => [books];

  final NewBooksModel books;

  Loaded({required this.books});
}

class Error extends NewBooksState {
  @override
  List<Object> get props => [String];

  final String message;

  Error({required this.message});
}