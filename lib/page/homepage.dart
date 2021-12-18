import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo/main.dart';
import 'package:todo/widget/addtodo.dart';
import 'package:todo/widget/todolistwidget.dart';
import 'package:todo/widget/Completed_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [TodoListWidget(), CompletedListWidget()];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          MyApp.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed',
          )
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffDC4D3D),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => new AddTodoDialog(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
