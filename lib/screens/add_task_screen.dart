import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/components/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String _textFieldValue;
  bool _isButtonDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: TextField(
              autofocus: true,
              onSubmitted: (value) {
                if (value != null) {
                  _textFieldValue = value;
                  setState(() {
                    _isButtonDisabled = false;
                  });
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 50.0, right: 50.0),
            child: RaisedButton(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 15.0),
              color: Colors.lightBlueAccent,
              onPressed: _isButtonDisabled
                  ? null
                  : () {
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(_textFieldValue);
                      Navigator.pop(context);
                    },
            ),
          )
        ],
      ),
    );
  }
}
