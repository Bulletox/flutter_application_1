import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskList(),
    );
  }
}

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<String> tasks = ["Tarea 1", "Tarea 2", "Tarea 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tareas"),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //agregamos una tarea
          _addTask(_addTaskToList);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTask(void Function(String) addTaskToList) { //<-- addTaskToList es una funcion que recibe un String
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTask = ''; //<-- variable que almacena la nueva tarea
        return AlertDialog(
          title: const Text("Nueva tarea"),
          content: TextField(
            controller: TextEditingController(),
            autofocus: true,
            decoration: const InputDecoration(
              labelText: "Tarea",
              hintText: "Escribe tu tarea",
            ),
            onChanged: (value) { //<-- cada vez que el usuario escriba algo en el TextField
              newTask = value; //<-- asignamos el valor del TextField a la variable newTask
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                // accion de agregar la tarea
                addTaskToList(newTask);
                Navigator.of(context).pop();
              },
              child: const Text("Agregar"),
            ),
          ],
        );
      },
    );
  }

  void _addTaskToList(String newTask) { //<-- funcion que recibe un String
    setState(() {
      tasks.add(newTask);
    });
  }
}
