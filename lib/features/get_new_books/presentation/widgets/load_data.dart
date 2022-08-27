import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/new_books_bloc.dart';

class LoadData extends StatefulWidget {
  const LoadData({Key? key}) : super(key: key);

  @override
  State<LoadData> createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {

  @override
  void initState(){
    super.initState();
    dispatchConcrete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [

        ],
      ),
    );
  }

  void dispatchConcrete() {
    BlocProvider.of<NewBooksBloc>(context)
        .add(GetNewBooks());
  }
}
