import 'package:beginner_app/provider/provider.dart';
import 'package:beginner_app/class/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class BeginnerApp extends ConsumerStatefulWidget {
  const BeginnerApp({super.key, required this.title});

  final String title;

  @override
  ConsumerState<BeginnerApp> createState() => _BeginnerAppState();
}


class _BeginnerAppState extends ConsumerState<BeginnerApp> {


final TextEditingController controller = TextEditingController();
String? editingTodoId; 


  @override
  Widget build(BuildContext context) {

    final List<Todo> todos =ref.watch(todoListProvider);
    debugPrint(todos.toString());
    final ThemeData theme = Theme.of(context);

    final textfield = SizedBox(
      width: 200,
      height:80,
      
      child: TextField(
      controller: controller,
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        )
      )
    )
    );

    final sendButton = SizedBox(
      child: ElevatedButton(
      onPressed: (){
        ref.read(todoListProvider.notifier).addTodo(Todo(todoId: const Uuid().v4(), title: controller.text, createdAt: DateTime.now()));
        controller.clear();
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: const Icon(Icons.add),
      )
      );

      final listtodos =  SizedBox(
        height: 500,
        width: 400,

        child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          final isEditing = todo.todoId == editingTodoId;
          final now = todo.createdAt;

          return Dismissible(
            background: Container(
            color: Colors.red,
            child: const Align(
            alignment: Alignment.centerRight, child: Icon(Icons.delete)),
            ),

            direction: DismissDirection.endToStart,

           onDismissed: (DismissDirection direction) {
              setState(() {
                todos.remove(todos[index]);
              });
            },

             key: Key(todo.todoId),

          child: ListTile(
            title: isEditing
                  ? TextField(
                      autofocus: true,
                      controller:  TextEditingController(text: todo.title)
                      ..selection = TextSelection.collapsed(offset: todo.title.length),
                      onSubmitted: (newTitle) {
                        setState(() {
                          ref.read(todoListProvider.notifier).editTodo(todo.todoId, newTitle);
                          editingTodoId = null;
                        });
                      },
                    )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(todo.title),
                      Text(DateFormat('yyyy年MM月dd日 HH:mm').format(now))
                      ]),
                  trailing: IconButton(
                  icon: Icon(todo.isCompleted ? Icons.check_box : Icons.check_box_outline_blank),
                  onPressed: () {
                  ref.read(todoListProvider.notifier).toggleCompletion(todo.todoId);
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
          )
          );
        },
      )
      );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text(widget.title)
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [textfield, sendButton],
            ),
            listtodos,
            SizedBox(
              width: 100,
              height: 40,
            child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/fire');
            }, child: const Text("次へ"))
            )

        ],
        )
    );
  }
}