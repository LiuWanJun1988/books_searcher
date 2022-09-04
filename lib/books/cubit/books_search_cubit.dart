
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class BooksSearchCubit extends Cubit<dynamic> {
  BooksSearchCubit() : super({});

  Future<void> getBooks(String searchItem, int pageKey) async {
    String url = 'https://www.googleapis.com/books/v1/volumes?q=$searchItem&startIndex=$pageKey';
    try {
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        emit(response.data);
      }
    } catch(_) {

    }
  }
}
