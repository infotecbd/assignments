import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final List<String> _todoList = [];
  final TextEditingController _textFieldController = TextEditingController();

  // Function to add a new task
  void _addTodoItem(String task) {
    setState(() {
      _todoList.add(task);
    });
    _textFieldController.clear();
  }

  // Function to edit an existing task
  void _editTodoItem(int index, String newTask) {
    setState(() {
      _todoList[index] = newTask;
    });
  }

  // Function to remove a task
  void _removeTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  // Function to display a dialog for adding a new task
  Future<void> _displayAddDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a new task'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Enter your task"),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('ADD'),
              onPressed: () {
                if (_textFieldController.text.isNotEmpty) {
                  _addTodoItem(_textFieldController.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  // Function to display a dialog for editing a task
  Future<void> _displayEditDialog(BuildContext context, int index) async {
    _textFieldController.text = _todoList[index]; // Set initial value to the current task
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit your task'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Edit your task"),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('SAVE'),
              onPressed: () {
                if (_textFieldController.text.isNotEmpty) {
                  _editTodoItem(index, _textFieldController.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do App Assignment'),
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_todoList[index]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _displayEditDialog(context, index), // Edit button
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeTodoItem(index), // Delete button
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayAddDialog(context), // Add new task
        child: Icon(Icons.add),
      ),
    );
  }
}
