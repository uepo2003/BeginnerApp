import 'package:beginner_app/class/todo_fire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> addTodoFire(TodoFire todofire) async {
    await db.collection('todos').doc(todofire.todoId).set(todofire.toJson());
  }

  Future<void> editTodoFire(TodoFire todofire, String newTitle) async {
    await db
        .collection('todos')
        .doc(todofire.todoId)
        .update(todofire.copyWith(title: newTitle).toJson());
  }

  Future<void> toggleTodoCompletion(TodoFire todofire) async {
    await db
        .collection('todos')
        .doc(todofire.todoId)
        .update(todofire.copyWith(isCompleted: !todofire.isCompleted).toJson());
  }

  Stream<List<TodoFire>> getTodos() {
    return db.collection('todos').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => TodoFire.fromJson(doc.data())).toList());
  }

  Future<void> removeTodoFire(String id) async {
    await db.collection('todos').doc(id).delete();
  }
}
