import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _LogState();
}
class _LogState extends State<Log> {
  final TextEditingController _roomNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _outTimeController = TextEditingController();
  final TextEditingController _inTimeController = TextEditingController();

  final CollectionReference _guestCollection =
  FirebaseFirestore.instance.collection('guests');

  Future<void> _addGuest() async {
    try {
      await _guestCollection.add({
        'room_number': _roomNumberController.text,
        'name': _nameController.text,
        'out_time': _outTimeController.text,
        'in_time': _inTimeController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Guest added successfully'),
      ));
      _roomNumberController.clear();
      _nameController.clear();
      _outTimeController.clear();
      _inTimeController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error adding guest: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guest List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _roomNumberController,
              decoration: InputDecoration(labelText: 'Room Number'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _outTimeController,
              decoration: InputDecoration(labelText: 'Out Time'),
            ),
            TextField(
              controller: _inTimeController,
              decoration: InputDecoration(labelText: 'In Time'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addGuest,
              child: Text('Add Guest'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _guestCollection.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final guests = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: guests.length,
                    itemBuilder: (context, index) {
                      final guest = guests[index].data();
                      return ListTile(
                        title: Text(guest!['name'] ?? ''),
                        subtitle: Text(guest['room_number'] ?? ''),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await _guestCollection
                                .doc(guests[index].id)
                                .delete();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Guest deleted successfully'),
                            ));
                          },
                        ),
                      );
                    },
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
