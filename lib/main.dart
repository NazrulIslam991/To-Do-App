import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(
// content: Text("Maximum 10 characters allowed!"),
// backgroundColor: Colors.red,
// duration: Duration(seconds: 2),
// ),

class _HomePageState extends State<HomePage> {
  List<String> _todoList = [];
  TextEditingController _todo_controller = TextEditingController();

  void addTask() {
    if (_todo_controller.text.length > 10) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Maximum 10 digit allowed!!!")));
    } else {
      setState(() {
        if (_todo_controller.text.isNotEmpty) {}
        _todoList.add("+880" + " " + _todo_controller.text);
        _todo_controller.clear();
      });
    }
  }

  void remove_task(int index) {
    setState(() {
      _todoList.removeAt(index); // Remove the task at the specified index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do apps"),
        centerTitle: true,
        backgroundColor: Colors.blue[500],
      ),
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 650,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7, top: 5),
                    child: Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        leading: Icon(Icons.mobile_friendly),
                        subtitle: Text(_todoList[index]),
                        title: Text(
                          "Phone Number",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        trailing: IconButton(
                          onPressed: () => remove_task(index),
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _todoList.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _todo_controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter Phone Number",
                        labelText: "Phone Number",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                        prefix: Text(
                          "+880 |  ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () => addTask(),
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
