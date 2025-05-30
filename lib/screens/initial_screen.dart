import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/task_inherited.dart';
import 'package:flutter_application_1/screens/form_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Task List'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 8, bottom: 80),
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
