import 'package:flutter_book_app/features/get_new_books/domain/entities/new_books.dart';
import 'books_model.dart';

class NewBooksModel extends NewBooks {

  NewBooksModel({
    required String error,
    required String total,
    required List<BooksModel> books,
  }): super(error:error, total: total, books: books);

  factory NewBooksModel.fromJson(Map<String, dynamic> json){
    return NewBooksModel(error: json['error'], total: json['total'], books: (json['books'] as List).map((e) => BooksModel.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson(){
    return {
      'error': error,
      'total': total,
      'books': books,
    };
  }
}