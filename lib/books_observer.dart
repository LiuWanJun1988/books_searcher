import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class BooksObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }
}
