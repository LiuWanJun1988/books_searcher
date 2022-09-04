import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_searcher/books/cubit/books_search_cubit.dart';
import 'package:books_searcher/books/view/books_view.dart';

class BooksPage extends StatelessWidget {

  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BooksSearchCubit(),
      child: BooksView(),
    );
  }
}
