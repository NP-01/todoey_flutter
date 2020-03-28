import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/components/add_toDoItem.dart';

import 'components/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemBuilder: (context, index) => ToDoItem(
          taskTitle: taskData.tasks[index].title,
          isChecked: taskData.tasks[index].isDone,
          checkBoxCallBack: (bool isChecked) {
            taskData.updateTaskState(index);
//            taskData.removeTask(index);
          },
          onLongPressCallback: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Delete Task'),
                content: Text('Are you sure you want to delete this task ?'),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        taskData.removeTask(index);
                        Navigator.pop(context);
                      },
                      child: Text('Yes')),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('No'),
                  ),
                ],
              ),
            );
          },
        ),
        itemCount: taskData.taskCount,
      ),
    );
  }
}

class Task {
  final String title;
  bool isDone;
  Task({this.title, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
