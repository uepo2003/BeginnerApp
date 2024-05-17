import 'package:beginner_app/state/firenotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoFireProvider = StreamProvider((ref) {
  return FireStoreService().getTodos();
});
