import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Login/google_login/is_new_user.dart';
import '../../doctor/model/doctor_model.dart';
import '../model/call_doctore_model.dart';
import '../view/widget/doctore_card_widget.dart';

class DoctoreListVM extends StatelessWidget {
  const DoctoreListVM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:  FirebaseFirestore.instance.collection("doctor").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(50),
              child: const CircularProgressIndicator());
        }
        return ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            return
               userDataModel.doctorList.contains(document.id) ?
              DoctoreCardWidget(doctorDataModel:CallDoctorModel.fromMap(doc: document),) : Container();
          }).toList(),
        );
    },

    );
  }
}
