import 'package:flutter/material.dart';
import 'package:mytodoapp/constraints/colors.dart';
import 'package:mytodoapp/screens/todo_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      drawer: Drawer(
        child: Text("this is drawer"),
      ),
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            searchBox(),
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 20),
              child: Text("All ToDos",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
            ),
            const TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
            TodoItem(),
          ],
        ),
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
    margin: EdgeInsets.only(top: 30),
    padding: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
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
