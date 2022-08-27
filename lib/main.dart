import 'package:flutter/material.dart';
import 'package:flutter_book_app/features/get_new_books/data/data_sources/local/entityCache/books_cache_entity.dart';
import 'package:flutter_book_app/features/get_new_books/data/data_sources/local/entityCache/new_books_cache_entity.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'features/get_new_books/presentation/pages/get_new_books_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
  initHiveAndRegisterAdapters();
}

void initHiveAndRegisterAdapters() async{
  final appDocumentDirectory =
  await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(NewBooksCacheEntityAdapter());
  Hive.registerAdapter(BooksCacheEntityAdapter());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Number trivia',
      theme: ThemeData(
          primaryColor: Colors.green.shade800,
          accentColor: Colors.green.shade600),
      home: GetNewBooksPage(),
    );
  }
}
