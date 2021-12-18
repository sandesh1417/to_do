import 'package:flutter/material.dart';
import 'package:todo/page/homepage.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final String title = 'Todo App';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xffDC4D3D),
          scaffoldBackgroundColor: Color(0xfff6f5ee),
        ),
        home: HomePage(),
      ),
    );
  }
}
