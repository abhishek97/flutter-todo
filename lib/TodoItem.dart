import 'package:flutter/material.dart';
import './model.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todo;
  final void Function(TodoModel) toggleCompleted;

  TodoItem(this.todo, this.toggleCompleted);

  @override
  Widget build(BuildContext context) {
    final textDecoration = todo.completed ? TextDecoration.lineThrough : null;
    return InkWell(
      child: Container(
        child: Text(todo.text, style: TextStyle(decoration: textDecoration)),
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
      ),
      onTap: () => toggleCompleted(todo),
    );
    
  }
}
