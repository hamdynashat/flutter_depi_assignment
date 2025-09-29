import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  String? email;
  String? password;
  final db = FirebaseFirestore.instance;
  var users = {"email": "Something", "password": "Something"};
  int id = 1;

  increaseCounter() {
    db.collection('id').doc('id').update({'count': FieldValue.increment(1)});
  }

  Future<void> createCollection({
    required String email,
    required String password,
    required String username,
  }) async {
    final usersCollection = {"email": email, "password": password};

    await db.collection("Users").doc(username).set(usersCollection);
    id++;
  }

  updateCollection(String docName) {
    db.collection("Users").doc(docName).update(users);
  }

  deleteCollection(String docName) {
    db.collection("Users").doc(docName).delete();
  }

  getCollection() {
    db.collection("users").get().then((docData) {
      for (var doc in docData.docs) {
        print(doc.data());
      }
    });
  }
}
