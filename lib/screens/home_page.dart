import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/widgets/todoListWidget.dart';

import '../widgets/addTodoDialog.dart';
import '../widgets/completedListWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget()
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.fact_check_outlined),label: "Todos"),
          BottomNavigationBarItem(icon: Icon(Icons.done,size: 28,),label: "Completed")
        ]),
        body: tabs[selectedIndex],
        floatingActionButton: FloatingActionButton(onPressed: (){
         showDialog(context: context, 
         barrierDismissible: false,
         builder: (context){
          return AddTodoDialogWidget();
          
         });
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          
        ),
        child: Icon(Icons.add),),
    );
  }
}