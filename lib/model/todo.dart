import 'package:flutter/material.dart';

class ToDo {
  String? id;
  String? todoText;
  bool? isDone;
  TimeOfDay? taskTime;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
    this.taskTime,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      todoText: json['todoText'],
      isDone: json['isDone'],
      taskTime: json['taskTime'] != null
          ? TimeOfDay(
              hour: (json['taskTime'] as Map<String, dynamic>)['hour'],
              minute: (json['taskTime'] as Map<String, dynamic>)['minute'],
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todoText': todoText,
      'isDone': isDone,
      'taskTime': taskTime != null
          ? {
              'hour': taskTime!.hour,
              'minute': taskTime!.minute,
            }
          : null,
    };
  }

  static List<ToDo> todoList() {
    return [];
  }
}
