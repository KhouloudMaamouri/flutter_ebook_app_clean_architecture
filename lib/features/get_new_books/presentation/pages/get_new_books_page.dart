import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_book_app/features/get_new_books/presentation/widgets/load_data.dart';
import 'package:logger/logger.dart';
import '../../../../injection_container.dart';
import '../bloc/new_books_bloc.dart';
import '../widgets/book_card.dart';
import '../widgets/loading_widget.dart';

final logger =  sl.get<Logger>();

class GetNewBooksPage extends StatelessWidget {
  const GetNewBooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl.get<NewBooksBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Books App"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 0.0,bottom: 0.0,right: 0.0,top: 2),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadData(),
              BlocBuilder<NewBooksBloc, NewBooksState>(builder: (context, state) {
                if (state is Empty) {
                  return LoadingWidget();
                } else if (state is Loaded) {
                  return  Column(
                         children:
                           List.generate(
                               state.books.books.length,
                                   (index) => BookCard(
                                   image: state.books.books[index].image,
                                   title: state.books.books[index].title,
                                   isbn13: state.books.books[index].isbn13,
                                   subtitle: state.books.books[index].subtitle,
                                   press: () => {
                                    logger.i("OnClick Book ${state.books.books[index].title}")
                                   })),
                        );
                }else if (state is Loading) {
                  return LoadingWidget();
                }
                return LoadingWidget();
              }),

            ],
          ),
        ),
      ),
    );
  }

}

