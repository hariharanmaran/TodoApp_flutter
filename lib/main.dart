import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController textController = TextEditingController();
  List<String> taskList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
            AppBar(title: const Text("Todo App"), backgroundColor: Colors.blue),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter a name"),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.white,
                  height: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    setState(() {
                      taskList.add(textController.text);
                      textController.clear();
                    });
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(taskList[index]),
                        ),
                      ),
                      MaterialButton(
                        child: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            taskList.removeAt(index);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
