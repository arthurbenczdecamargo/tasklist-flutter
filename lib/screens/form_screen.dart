import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(value) {
    if (int.parse(value) > 5 || int.parse(value) < 1) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Task'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight * 0.95,
                width: constraints.maxWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3, color: Colors.black12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (valueValidator(value)) {
                            return 'Name is required';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Task',
                          fillColor: Colors.white60,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (valueValidator(value) ||
                              difficultyValidator(value)) {
                            return 'Difficulty (1-5) is required';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: difficultyController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Difficulty',
                          fillColor: Colors.white60,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        validator: (String? value) {
                          if (valueValidator(value)) {
                            return 'Image URL is required';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.url,
                        controller: imageController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Image URL',
                          fillColor: Colors.white60,
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 144,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.blue),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageController.text,
                          errorBuilder: (
                            BuildContext context,
                            Object exception,
                            StackTrace? stackTrace,
                          ) {
                            return Image.asset('assets/images/no_image.png');
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          TaskInherited.of(widget.taskContext).newTask(
                            nameController.text,
                            imageController.text,
                            int.parse(difficultyController.text),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Creating Task')),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Create Task'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
