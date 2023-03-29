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
  bool changedButton = false;
  final todosList = ToDo.todoList();

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
                searchBox(),
                Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
                  child: const Text("All ToDos",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                ),
                for (ToDo todo in todosList)
                  TodoItem(
                    todo: todo,
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Add what task you want to do today",
                      border: InputBorder.none,
                    ),
                  ),
                )),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Icon(
                      changedButton ? Icons.check : Icons.add,
                    ),
                    onPressed: () async {
                      setState(() {
                        changedButton = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: changedButton
                            ? Color.fromARGB(255, 6, 241, 18)
                            : tdBlue,
                        minimumSize: Size(60, 60),
                        elevation: 10),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      // backgroundColor: tdBGColor,
      // title: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Icon(
      //       Icons.menu,
      //       color: tdBlack,
      //       size: 30,
      //     ),
      //     Container(

      //       height: 40,
      //       width: 40,
      //       child: ClipRRect(
      //         child: Image.asset("assets/images/avatar.png"),
      //         borderRadius: BorderRadius.circular(20),
      //       ),
      //     )
      //   ],
      // ),

      automaticallyImplyLeading: true,
      actions: [
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            child: Image.asset("assets/images/avatar.png"),
            borderRadius: BorderRadius.circular(20),
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
