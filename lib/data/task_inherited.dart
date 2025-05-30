import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required super.child});

  final List<Task> taskList = [
    Task("Learn Flutter", "assets/images/dash.png", 3),
    Task('Ride a bike', "assets/images/bike.webp", 2),
    Task("Read a book", "assets/images/book.jpg", 1),
    Task("Meditate", "assets/images/meditation.jpeg", 2),
    Task("Workout", "assets/images/workout.png", 4),
    Task("Play videogames", "assets/images/game.png", 1),
  ];

  void newTask(String name, String image, int difficulty) {
    taskList.add(Task(name, image, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList != taskList;
  }
}
