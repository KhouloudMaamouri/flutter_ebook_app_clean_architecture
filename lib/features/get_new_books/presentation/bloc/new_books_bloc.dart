import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_book_app/features/core/usecases/usecase.dart';
import '../../data/models/new_books_model.dart';
import '../../domain/usecases/get_new_books.dart';
part 'new_books_event.dart';
part 'new_books_state.dart';

class NewBooksBloc extends Bloc<NewBooksEvent, NewBooksState> {
  final GetBooks getNewBooks;

  NewBooksBloc({required this.getNewBooks}) : super(Empty()) {
    on<NewBooksEvent>((event, emit) async {
      if (event is GetNewBooks) {
        emit(Loading());

        final failureOrNewBooks = await getNewBooks.call(NoParams());

        failureOrNewBooks.fold(
            (failure) => emit(Error(message: failure.toString())),
            (data) => emit(Loaded(books: data)));
      }
    });
  }
}
