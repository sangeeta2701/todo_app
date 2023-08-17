import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/todoContainer.dart';

import '../provider/todos.dart';


class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;
    return  todos.isEmpty?Center(child: Text("No Todos",style: TextStyle(fontSize: 20),)) :  ListView.separated(
      padding: EdgeInsets.all(16),
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoContainer(todo: todo);
      },
      itemCount: todos.length,
      separatorBuilder: (context, index) {
        return Container(height: 8,);
      },
    );
  }
}