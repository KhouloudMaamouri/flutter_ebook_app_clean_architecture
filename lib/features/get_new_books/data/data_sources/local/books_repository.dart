
import '../../models/new_books_model.dart';

abstract class NewBooksRepository {

    Future<void>  insert(NewBooksModel books);
    Future<NewBooksModel> get();
}