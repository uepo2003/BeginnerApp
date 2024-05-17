import 'package:beginner_app/state/notifier.dart';
import 'package:beginner_app/class/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});
