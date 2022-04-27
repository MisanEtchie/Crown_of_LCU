import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference users = FirebaseFirestore.instance.collection("Users");

Future<void> addUser() {
  return users.doc('votes').set(
    {
      'miss': "",
      'mr': "",

      //'uid': uid,
    },
  );
}

Future<void> updateUser({String miss = ""}) {
  return users.doc('votes').update({'miss': miss});
}

Future<void> updateUser2({String mr = ""}) {
  return users.doc('votes').update({'mr': mr});
}



/*Future<void> userSetup(String mrlcu, String misslcu) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();

  users.doc("Votes");

  users.add({
    "mrlcu": mrlcu,
    "misslcu": misslcu,
    "uid": uid,
  });
  return;
}*/

/*Future<void> miss() {
  return users.doc();
}*/
