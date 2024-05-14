import 'package:beginner_app/class/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  void addTodo(Todo todo) async {
    state = [...state, todo];
  }

  void editTodo(String id, String title) async {
    state = [
      for (final todo in state)
        if (todo.todoId == id)
          todo.copyWith(
            title: title,
          )
        else
					todo,
    ];

  }

   void toggleCompletion(String todoId) {
    state = [
       for (final todo in state)
        if (todo.todoId == todoId)
          todo.copyWith(
            isCompleted: !todo.isCompleted,
          )
        else
					todo,
    ];
   }

  void removeTodo(String targetId){
    state = state.where((todo) => todo.todoId != targetId).toList();
  }
}