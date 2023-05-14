import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final FirebaseFirestore _fire = FirebaseFirestore.instance;

  /*
  How to use example
  DatabaseServices Student = DatabaseServices();
  Student.addStudent(id:"1101", name:"aman", room:"103", branch:"IT", mobile:"9756547687");
  */
  Future<void> addStudent({required String id,required String name,required String room,required String branch,required String mobile}) async {
    Map<String, dynamic> stdData = {
      "id": id,
      "name": name,
      "roomNo": room,
      "branch": branch,
      "mobileNo":mobile
    };
    await _fire.collection("users").doc(stdData['id']).set(stdData);
  }

  /*
  How to use example
  DatabaseServices Student = DatabaseServices();
  Map<String, dynamic> data;
  data = await Student.getInfo(id: "1101");
  if(kDebugMode){
    print(data);
  }*/
  Future<Map<String, dynamic>> getInfo({required String id}) async {

  DocumentSnapshot snap = await _fire.collection("users").doc(id).get();
  Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
  return data;
  }

  /*
  How to use example
  DatabaseServices student = DatabaseServices();
  student.updateRoom(id: "1101", newRoom: "330");
   */
  Future<void> updateRoom({required String id, required String newRoom}) async{
    await _fire.collection("users").doc(id).update({
      "roomNo": newRoom
    });
  }

  /*Map<String, dynamic> std_data = {
    "id": "1102",
    "name": "Tanny",
    "roomNo": "210",
    "branch": "IT",
    "mobileNo":"9645764765"
  };

  await _fire.collection("users").doc(std_data['id']).set(std_data);

  QuerySnapshot shot = await _fire.collection("users").get();
  for(var doc in shot.docs){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    log(data['name']);
  }

  QuerySnapshot snapshot =
  await _fire.collection("users").get();
  if (kDebugMode) {
    print("Number of documents: ${snapshot.docs.length}");
  }

  DocumentSnapshot snapshot1 = await _fire.collection("users").doc("pUgp2dqmuCu6zU04djkx").get();

  Map<String, dynamic> data = snapshot1.data() as Map<String, dynamic>;
  String name = data['name'];
  log(name);

  QuerySnapshot snapshot3 = await _fire.collection("users").get();
  for (var doc in snapshot3.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if(data['branch']=="IT"){
      log("message");
      log(doc.id);
    }
    String id = data['id'];
    String name = data['name'];
    String room = data['roomNo'];
    String branch = data['branch'];
    int mobile = data['mobileNo'];
    if (kDebugMode) {
      print("Id:        $id\n"
          "Name:      $name\n"
          "Room No:   $room\n"
          "Branch:    $branch\n"
          "Mobile No: $mobile");
    }
  }*/


}