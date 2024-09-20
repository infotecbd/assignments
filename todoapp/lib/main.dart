import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API To-Do App Assignment',
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
  List<String> _todoList = [];
  final TextEditingController _textFieldController = TextEditingController();
  final String apiUrl = 'https://task.teamrabbil.com/api/v1';

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  // Function to fetch tasks from the API
  Future<void> _fetchTodos() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        _todoList = List<String>.from(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load tasks');
    }
  }


  Future<void> _addTodoItem(String task) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode({'task': task}),
    );

    if (response.statusCode == 201) {
      setState(() {
        _todoList.add(task);
      });
    } else {
      throw Exception('Failed to add task');
    }
    _textFieldController.clear();
  }


  Future<void> _editTodoItem(int index, String newTask) async {
    final String taskUrl = '$apiUrl/${index + 1}';
    final response = await http.put(
      Uri.parse(taskUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode({'task': newTask}),
    );

    if (response.statusCode == 200) {
      setState(() {
        _todoList[index] = newTask;
      });
    } else {
      throw Exception('Failed to edit task');
    }
  }


  Future<void> _removeTodoItem(int index) async {
    final String taskUrl = '$apiUrl/${index + 1}'; // Assuming tasks are 1-indexed in the API
    final response = await http.delete(Uri.parse(taskUrl));

    if (response.statusCode == 200) {
      setState(() {
        _todoList.removeAt(index);
      });
    } else {
      throw Exception('Failed to delete task');
    }
  }


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

  // Display dialog for editing a task
  Future<void> _displayEditDialog(BuildContext context, int index) async {
    _textFieldController.text = _todoList[index];
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
        title: Text('API To-Do App'),
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
                    onPressed: () => _displayEditDialog(context, index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeTodoItem(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayAddDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
