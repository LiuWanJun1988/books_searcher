import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:books_searcher/books/cubit/books_search_cubit.dart';

class BooksView extends StatelessWidget {
  BooksView({super.key});

  final TextEditingController searchTextController = TextEditingController();
  final ScrollController listViewScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        context
                            .read<BooksSearchCubit>()
                            .getBooks(searchTextController.text, 0);
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchTextController.clear();
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          ),
        ),
        body: Center(
          child: BlocBuilder<BooksSearchCubit, dynamic>(
            builder: (context, books) {
              if (books.containsKey("totalItems") == false) {
                return Text("Search Documents", style: textTheme.titleMedium);
              }

              return ListView.builder(
                  itemCount: books['items'] != null ? books['items'].length : 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: ListTile(
                          minVerticalPadding: 20,
                          leading: books['items'][index]['volumeInfo']
                                  .containsKey('imageLinks')
                              ? Image.network(books['items'][index]
                                      ['volumeInfo']['imageLinks']
                                  ['smallThumbnail'])
                              : const Icon(
                                  Icons.file_present,
                                  size: 48,
                                ),
                          title: Text(
                              books['items'][index]['volumeInfo']['title'])),
                    );
                  });
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<BooksSearchCubit, dynamic>(
          builder: (context, books) {
            if (books.containsKey("totalItems")) {
              return NumberPaginator(
                numberPages: books["totalItems"],
                onPageChange: (int index) {
                  context
                      .read<BooksSearchCubit>()
                      .getBooks(searchTextController.text, index);
                },
              );
            }

            return Container(height: 20,);
          },
        ));
  }
}
