import 'package:flutter/material.dart';
import 'package:mytodoapp/constraints/colors.dart';
import 'package:mytodoapp/model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: Icon(
            todo.isDone! ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue),
        tileColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: todo.isDone! ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          child: IconButton(
            color: tdRed,
            iconSize: 30,
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
