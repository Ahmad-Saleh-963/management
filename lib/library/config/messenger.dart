import 'dart:async';

import 'package:get_it/get_it.dart';

import 'global_change_notifier.dart';

///
///  the T is the type of the value
///
abstract mixin class Messenger<T> {
  late StreamSubscription<(String key, T)> streamSubscription;

  prepareMessengerListen() {
    streamSubscription =
        GetIt.instance.get<GlobalChangeNotifier<T>>().subject.listen((value) {
          onMessage(value.$1, value.$2);
        });
  }

  void onMessage(String key, T messageValue);

  Future<void> closeMessenger() async {
    await streamSubscription.cancel();
  }
}