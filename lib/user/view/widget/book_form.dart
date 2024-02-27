import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../Login/google_login/is_new_user.dart';

class BookForm extends StatelessWidget {
  late String doctorId;

  BookForm({Key? key, required this.doctorId}) : super(key: key);
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: AlertDialog(
        title: const Text("Book doctor now"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text("add any note's for doctor"),
                subtitle: TextFormField(
                  controller: noteController,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                addNewRequestToDoctor({
                  "userId": userIdData,
                  "note": noteController.text,
                  "userModelData": userDataModel.UserModeltoMap()
                }, doctorId);
              },
              child: const Text("Book now"))
        ],
      ),
    );
  }
}

addNewRequestToDoctor(Map newOrder, String doctorId) async {
  List newmap;
  CollectionReference doctorCollection = FirebaseFirestore.instance.collection("doctor");
  DocumentSnapshot<Object?> x = await doctorCollection.doc(doctorId).get().then((value) {
    dynamic map = value.data();
    newmap = map["requestList"] as List;
     newmap.add(newOrder);
    doctorCollection.doc(doctorId).update({"requestList": newmap});
    addDoctoreToUser(doctorId);
    return value;
  });
}

addDoctoreToUser(String doctorId) async {
  List newmap;
  CollectionReference user = FirebaseFirestore.instance.collection("usersData");
  DocumentSnapshot<Object?> x = await user.doc(userIdData).get().then((value) {
    dynamic map = value.data();
    newmap = map["doctorList"] as List;
    newmap.add(doctorId);
    user.doc(userIdData).update({"doctorList": newmap});
    return value;
  });
}
