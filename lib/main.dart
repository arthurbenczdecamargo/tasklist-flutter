import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/task_inherited.dart';
import 'package:flutter_application_1/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: TaskInherited(child: const HomePage()),
    );
  }
}
