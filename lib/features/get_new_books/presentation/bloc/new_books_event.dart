part of 'new_books_bloc.dart';

abstract class NewBooksEvent extends Equatable {
  const NewBooksEvent();
}


class GetNewBooks extends NewBooksEvent {
  @override
  List<Object?> get props => [];
}