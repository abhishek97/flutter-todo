import 'package:flutter/material.dart';
import './model.dart';
import './TodoItem.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var todos = <TodoModel>[TodoModel("Abhishek", false)];

  void addTodo(String text) {
    if (text == '') return;

    setState(() {
      todos.add(TodoModel(text, false));
    });
  }

  void toggleCompleted(TodoModel t) {
    setState(() {
      t.completed = !t.completed;
    });
  }

  void removeCompleted () {
    setState(() {
      this.todos = this.todos.where((t) => !t.completed).toList();
    });
  }

  Widget build(BuildContext ctx) {
    final todoItems =
        this.todos.map((e) => TodoItem(e, toggleCompleted)).toList();

    final completedTodos = this.todos.where((t) => t.completed);
    return SingleChildScrollView(child: Column(
      children: <Widget>[
        NewTodo(
          addTodo: this.addTodo,
        ),
        Column(
          children: todoItems,
        ),
        RaisedButton(
          child: Text('Clear Done (${completedTodos.length})'),
          onPressed: removeCompleted,
        )
      ],
    ));
  }
}

class NewTodo extends StatefulWidget {
  Function(String) addTodo;

  NewTodo({this.addTodo});

  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  String text;
  var textController = TextEditingController();

  void onPress () {
    widget.addTodo(this.textController.text);
    this.textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: TextField(
//            onChanged: setNewTodoText,
            controller: textController,
          ),
          padding: EdgeInsets.all(20),
        ),
        RaisedButton(
          child: Text('Add Todo'),
          onPressed: onPress,
        )
      ],
    );
  }
}
