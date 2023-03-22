import 'package:flutter/material.dart';
import 'package:mytodoapp/constraints/colors.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: Icon(Icons.check_box, color: tdBlue),
        tileColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        title: Text(
          "Check Email",
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        trailing: Container(
          child: IconButton(
            color: tdRed,
            iconSize: 30,
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
