import 'dart:convert';
import 'package:flutter_book_app/features/get_new_books/data/models/new_books_model.dart';
import 'package:http/http.dart' as http;
import '../../../../core/error/exceptions.dart';

abstract class GetNewBooksRemoteDataSource {
  Future<NewBooksModel> getNewBooks();
}

class GetNewBooksRemoteDataSourceImpl implements GetNewBooksRemoteDataSource {

  final http.Client client;
  GetNewBooksRemoteDataSourceImpl({required this.client});

  @override
  Future<NewBooksModel> getNewBooks() async => _getNewBooksFromUrl();

  Future<NewBooksModel> _getNewBooksFromUrl() async{
    var url =  Uri.parse('https://api.itbook.store/1.0/new');

    final response = await client.get(url, headers: {
      'Content-Type':'application/json'
    });

    if(response.statusCode == 200){
      return NewBooksModel.fromJson(json.decode(response.body));
    }else{
      throw  ServerException();
    }
  }
}