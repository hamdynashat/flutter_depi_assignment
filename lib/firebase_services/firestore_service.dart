import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  String? email;
  String? password;
  final db = FirebaseFirestore.instance;
  var users = {"email": "Something", "password": "Something"};
  final updates = <String, dynamic>{"timestamp": FieldValue.serverTimestamp()};


  Future<void> loginCollection({
    required String email,
    required String password,
    required String username,
  }) async {
    final usersCollection = {"email": email, "password": password};

    await db.collection("Users").doc(username).update(usersCollection);
    await db.collection("Users").doc(username).update(updates);
  }

  Future<void> signUpCollection({
    required String email,
    required String password,
    required String username,
    required String firstName,
    required String secondName,
    required String lastName,
  }) async {
    await db.collection("Users").doc(username).set({
      "email": email,
      "password": password,
      "name": {
        "firstName": firstName,
        "secondName": secondName,
        "lastName": lastName,
      }
    });
    await db.collection("Users").doc(username).update(updates);
  }


  Future<void> createCollection({
    required String email,
    required String password,
    required String username,
  }) async {
    final usersCollection = {"email": email, "password": password};

    await db.collection("Users").doc(username).set(usersCollection);
    await db.collection("Users").doc(username).update(updates);
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
