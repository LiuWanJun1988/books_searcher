import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:books_searcher/app.dart';
import 'package:books_searcher/books_observer.dart';

void main() {
  Bloc.observer = BooksObserver();
  runApp(const BooksApp());
}
