import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Entry System"),
            centerTitle: true,
            backgroundColor: Colors.red[600],
            leading: const Icon(Icons.menu)),
        body: Center(
          child: Table(
            border: TableBorder.all(width: 1.0, color: Colors.white),
            children: const [
              TableRow(
                children: [
                  TableCell(
                    child: Text('   Room',
                        style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                  ),
                  TableCell(
                    child: Text('Name',
                        style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                  ),
                  TableCell(
                    child: Text("In Time",
                        style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                  ),
                  TableCell(
                    child: Text("Out Time",
                        style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Text('   207',
                        style: TextStyle(color: Colors.green, fontSize: 20.0)),
                  ),
                  TableCell(
                    child: Text('Manish',
                        style: TextStyle(color: Colors.green, fontSize: 20.0)),
                  ),
                  TableCell(
                    child: Text('6:03',
                        style: TextStyle(color: Colors.green, fontSize: 20.0)),
                  ),
                  TableCell(
                      child: Text('7:41',
                          style:
                              TextStyle(color: Colors.green, fontSize: 20.0)))
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Text('   103',
                        style: TextStyle(color: Colors.red, fontSize: 20.0)),
                  ),
                  TableCell(
                    child: Text('Raj',
                        style: TextStyle(color: Colors.red, fontSize: 20.0)),
                  ),
                  TableCell(
                    child: Text('7:40',
                        style: TextStyle(color: Colors.red, fontSize: 20.0)),
                  ),
                  TableCell(
                    child: Text('',
                        style: TextStyle(color: Colors.red, fontSize: 20.0)),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            child: const Icon(Icons.add, color: Colors.blue),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
