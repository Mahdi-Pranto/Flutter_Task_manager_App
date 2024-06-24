import 'package:flutter/material.dart';
import 'package:mytodoapp/screens/todo_item.dart';

class ToDo {
  String? id;
  String? todoText;
  TimeOfDay? taskTime;
  bool? isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
    this.taskTime,
  });

  static List<ToDo> todoList() {
    return [
      // ToDo(id: "01", todoText: "Morning Exercise", isDone: true),
      // ToDo(id: "02", todoText: "Go to Market", isDone: true),
      // ToDo(
      //   id: "03",
      //   todoText: "Check Email",
      // ),
      ToDo(
        id: "04",
        todoText: "Team Meeting",
      ),
      ToDo(id: "05", todoText: "Take Breakfast", taskTime: TimeOfDay.now()),
      ToDo(id: "06", todoText: "Take a nap", taskTime: TimeOfDay.now()),
      // ToDo(id: "07", todoText: "Take bath"),
    ];
  }
}
