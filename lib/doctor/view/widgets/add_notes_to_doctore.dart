import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../user/model/medical_history_model.dart';

class AddNote extends StatelessWidget {
  late String doctorName, pationtId;

  AddNote({Key? key, required this.doctorName, required this.pationtId,}) : super(key: key);
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: AlertDialog(
        title: const Text("add note "),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text("add any note"),
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
                addAddNote(noteController.text, doctorName, pationtId );
              },
              child: const Text("send"))
        ],
      ),
    );
  }


}
void addAddNote(String text, String doctorName, String pationtId) {
  List newmap;
  CollectionReference doctorCollection = FirebaseFirestore.instance.collection("usersData");
  doctorCollection.doc(pationtId).get().then((value) {
    dynamic map = value.data();
    newmap = map["medicalHistory"] as List;
    newmap.add({
      "doctorName":doctorName,text:text,"date":"3/7/2022"
    });
    doctorCollection.doc(pationtId).update({"medicalHistory": newmap});
  });
}