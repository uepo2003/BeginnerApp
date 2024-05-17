import 'package:beginner_app/provider/fireprovider.dart';
import 'package:beginner_app/state/firenotifier.dart';
import 'package:beginner_app/class/todo_fire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class BeginnerAppTwo extends ConsumerStatefulWidget {
  const BeginnerAppTwo({super.key});

  @override
  BeginnerAppTwoState createState() => BeginnerAppTwoState();
}

class BeginnerAppTwoState extends ConsumerState<BeginnerAppTwo> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController firecontroller = TextEditingController();
    final fireclass = FireStoreService();
    String? editingTodoId;

    AsyncValue<List<TodoFire>> todos = ref.watch(todoFireProvider);

    final textfield = SizedBox(
        width: 200,
        height: 80,
        child: TextField(
            controller: firecontroller,
            decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ))));

    final sendButton = SizedBox(
        child: ElevatedButton(
      onPressed: () async {
        try {
          await fireclass.addTodoFire(TodoFire(
              todoId: const Uuid().v4(),
              title: firecontroller.text,
              createdAt: DateTime.now()));
          firecontroller.clear();
        } catch (e) {
          debugPrint('Error : $e');
        }
        firecontroller.clear();
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: const Icon(Icons.add),
    ));

    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo Fire"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [textfield, sendButton],
            ),
            todos.when(
              data: (todos) => SizedBox(
                height: 400,
                width: 300,
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    final isEditing = todo.todoId == editingTodoId;
                    return Dismissible(
                      key: Key(todo.todoId),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          fireclass.removeTodoFire(todo.todoId);
                        });
                      },
                      child: ListTile(
                        title: isEditing
                            ? TextField(
                                controller:
                                    TextEditingController(text: todo.title)
                                      ..selection = TextSelection.collapsed(
                                          offset: todo.title.length),
                                onSubmitted: (newTitle) {
                                  setState(() {
                                    fireclass.editTodoFire(todo, newTitle);
                                    editingTodoId = null;
                                  });
                                },
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(todo.title),
                                  Text(DateFormat('yyyy年MM月dd日 HH:mm')
                                      .format(todo.createdAt))
                                ],
                              ),
                        trailing: IconButton(
                          icon: Icon(todo.isCompleted
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                          onPressed: () {
                            setState(() {
                              fireclass.toggleTodoCompletion(todo);
                            });
                          },
                        ),
                        onTap: () {
                          setState(() {
                            if (isEditing) {
                              editingTodoId = null;
                            } else {
                              editingTodoId = todo.todoId;
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Error: $e'),
            )
          ],
        ));
  }
}
