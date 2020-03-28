import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function checkBoxCallBack;
  final Function onLongPressCallback;

  ToDoItem(
      {this.taskTitle,
      this.isChecked,
      this.checkBoxCallBack,
      this.onLongPressCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CheckboxListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            decoration: isChecked == true
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationThickness: 2.0,
          ),
        ),
        value: isChecked,
        onChanged: checkBoxCallBack,
      ),
      onLongPress: onLongPressCallback,
    );
  }
}
