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
  final todosList = ToDo.todoList();
  final TextEditingController _taskController = TextEditingController();
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      drawer: appSidebar(),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                searchBox(),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      _showAddTaskDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(60, 60),
                        elevation: 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text("Add New Task"),
                      ],
                    ),
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
        SizedBox(
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

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _taskController,
                decoration: const InputDecoration(
                  hintText: "Add task for today",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(250, 50),
                  maximumSize: const Size(250, 50),
                ),
                onPressed: () async {
                  _selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                },
                child: const Text("Select Time"),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Add"),
              onPressed: () {
                setState(() {
                  if (_taskController.text.isNotEmpty) {
                    todosList.add(ToDo(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        todoText: _taskController.text,
                        taskTime: _selectedTime));
                    _taskController.clear();
                    Navigator.of(context).pop();
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }
}

// app left side bar
Widget appSidebar() {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const UserAccountsDrawerHeader(
          // <-- SEE HERE
          decoration: BoxDecoration(color: tdBGColor),
          accountName: Text(
            "Mahdi Islam",
            style: TextStyle(
              color: tdBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          accountEmail: Text(
            "mahdiprantoblog@gmail.com",
            style: TextStyle(
              color: tdGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          currentAccountPicture:
              Image(image: AssetImage("assets/images/avatar.png")),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
          ),
          title: const Text(
            'Page 1',
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.train,
          ),
          title: const Text('Page 2'),
          onTap: () {},
        ),
      ],
    ),
  );
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
