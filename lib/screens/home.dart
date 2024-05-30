import 'package:flutter/material.dart';
import 'package:mytodoapp/constraints/colors.dart';
import 'package:mytodoapp/model/todo.dart';
import 'package:mytodoapp/screens/todo_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showInputField = false;
  final todosList = ToDo.todoList();
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      drawer: const Drawer(
        child: Text("this is drawer"),
      ),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                // searchBox(),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showInputField = !showInputField;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(60, 60),
                        elevation: 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text("Add Task"),
                      ],
                    ),
                  ),
                ),
                if (showInputField)
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _taskController,
                            decoration: const InputDecoration(
                              hintText: "Add task for today",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.check),
                          color: tdBlue,
                          onPressed: () {
                            setState(() {
                              if (_taskController.text.isNotEmpty) {
                                todosList.add(ToDo(
                                    id: DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString(),
                                    todoText: _taskController.text));
                                _taskController.clear();
                                showInputField = false;
                              }
                            });
                          },
                        )
                      ],
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: const Text("All Tasks",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                ),
                for (ToDo todo in todosList)
                  TodoItem(
                    todo: todo,
                    onDeleteItem: _deleteTask,
                    onToggleDone: _toggleDone,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _deleteTask(String id) {
    setState(() {
      todosList.removeWhere((todo) => todo.id == id);
    });
  }

  void _toggleDone(String id) {
    setState(() {
      final todo = todosList.firstWhere((todo) => todo.id == id);
      todo.isDone = !todo.isDone!;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      automaticallyImplyLeading: true,
      actions: [
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/images/avatar.png"),
          ),
        ),
      ],
    );
  }
}

Widget searchBox() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const TextField(
      decoration: InputDecoration(
          hintText: "Search",
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: tdBlack,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
          border: InputBorder.none),
    ),
  );
}
