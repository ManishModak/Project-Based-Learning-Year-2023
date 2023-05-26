import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DailyLog extends StatefulWidget {
  const DailyLog({Key? key}) : super(key: key);

  @override
  State<DailyLog> createState() => _DailyLogState();
}

class _DailyLogState extends State<DailyLog> {
  DateTime currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: const Text(
          "Daily Log",
          style: TextStyle(letterSpacing: 1.25),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection(DateFormat('yyyy:MM:dd').format(currentTime)).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text('No Data');
          }

          final documents = snapshot.data!.docs;


          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FittedBox(
              child: DataTable(
                columnSpacing: 16, // Adjust the spacing between columns
                columns: const [
                  DataColumn(label: Text('ID',style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text('Name',style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text('Room',style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text('Out time',style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text('In time',style: TextStyle(color: Colors.white))),
                ],
                rows: documents.map((DocumentSnapshot<Map<String, dynamic>> document) {
                  final data = document.data();
                  final inTime = data!['inTime'];

                  final color = inTime == null ? Colors.red[400] : Colors.green[400];

                  return DataRow(
                    cells: [
                      DataCell(Text(data['id'],style: TextStyle(color: color))),
                      DataCell(Text(data['name'],style: TextStyle(color: color))),
                      DataCell(Text(data['roomNo'],style: TextStyle(color: color))),
                      DataCell(Text(data['outTime'],style: TextStyle(color: color))),
                      DataCell(Text(data['inTime'] ?? '',style: TextStyle(color: color))),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
