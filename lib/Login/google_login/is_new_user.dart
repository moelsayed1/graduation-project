import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:core';

import '../../doctor/model/doctor_model.dart';
import '../../doctor/view/Screens/doctor_home_screen.dart';

import '../../user/model/user_model.dart';
import '../../user/view/Screens/user_home_screen.dart';
import '../View/Screens/sellect_type_screen.dart';
import 'package:med_app/navigator/navigator_provider.dart';

late bool isDoctore ;
late String userIdData ;
late User userCredentialData ;
late UserModel userDataModel ;
late DoctorModel DoctorDataModelLogin ;
isNewUser(UserCredential userCredential, context) async {
  userCredentialData = userCredential.user! ;
  CollectionReference users = FirebaseFirestore.instance.collection("usersData");
  users
      .doc(userCredential.user!.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) async {
    if (documentSnapshot.exists) {
      isDoctore = false ;
      userIdData = userCredential.user!.uid ;
      userDataModel= UserModel.fromMap(documentSnapshot);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserHomeScreen()));
    } else {
      userCredentialData = userCredential.user! ;
      FirebaseFirestore.instance.collection("doctor")
          .doc(userCredential.user!.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists) {
          isDoctore = true ;
          DoctorDataModelLogin = await DoctorModel.fromMap(documentSnapshot) ;
          DoctorModel dDM =await DoctorModel.fromMap(documentSnapshot) ;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) =>
              DoctorHomeScreen( doctorModel: dDM )));
        } else{
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SelecttypeScreen(
          userID: documentSnapshot.id,
          )));
    }

    });
  }});
}

