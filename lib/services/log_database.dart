import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:mat_security/services/main_database.dart';

class LogDatabase{
  final FirebaseFirestore _fire = FirebaseFirestore.instance;

  /*
  Has the dual use of entry and exit
  Here is an example on how to use it
  LogDatabase log = LogDatabase();
  log.addLog(id: "1101");
  log.addLog(id: "1102");
   */
  Future<void> addLog({required String id}) async {
    DateTime currentTime = DateTime.now();
    String formattedTime = DateFormat('HH:mm:ss').format(currentTime);
    Map<String, dynamic> data;

    QuerySnapshot snapshot = await _fire.collection("daily log").get();

    for (var doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (data['id'] == id) {
        await _fire.collection("daily log").doc(doc.id).update({
          "inTime": formattedTime,
        });
        return;
      }
    }


    MainDatabase student = MainDatabase();
    data = await student.getInfo(id: id);

    Map<String, dynamic> stdData = {
      "id": id,
      "roomNo": data['roomNo'],
      "name": data['name'],
      "outTime": formattedTime,
      "inTime":null
    };
    await _fire.collection("daily log").add(stdData);
  }
}