import 'package:rxdart/rxdart.dart';

class GlobalChangeNotifier<T> {
  final PublishSubject<(String key,T)> subject = PublishSubject<(String key,T)>();
}