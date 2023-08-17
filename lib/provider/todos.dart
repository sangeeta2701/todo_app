import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
        createdTime: DateTime.now(),
        title: "Buy Food",
        description: "- Eggs\n- Milk\n- Bread",
        id: ""),
    Todo(
        createdTime: DateTime.now(),
        title: "Plan family trip",
        description: "- Choose Place\n- Check Tickets\n- Check hotels",
        id: ""),
    Todo(
        createdTime: DateTime.now(),
        title: "Walk the dog",
        description: "",
        id: "")
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
