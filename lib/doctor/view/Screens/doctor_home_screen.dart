import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_app/user/model/user_model.dart';
import '../../../Login/google_login/is_new_user.dart';
import '../../../Login/google_login/sign_google.dart';
import '../../../user/view/Screens/user_profile.dart';
import '../../model/doctor_model.dart';
import '../../navigation/doctore_navigation.dart';
 late DoctorModel currentDoctorModelData;
class DoctorHomeScreen extends StatelessWidget {
  late DoctorModel _currentDoctorModelData;
  DoctorHomeScreen({Key? key, required DoctorModel doctorModel})
      : super(key: key) {
    currentDoctorModelData = doctorModel;
    _currentDoctorModelData = doctorModel ;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar:
          Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return  CurvedNavigationBar(
              color:Color(0xFF585CE5) ,
              buttonBackgroundColor:Color(0xFF585CE5) ,
              backgroundColor: Color(0xffffff),
              items:doctorScreensIconList,
              onTap: (index) {
                 ref.watch(doctorselectedScreenProvider.state).state = index ;
              },
            ) ;
          },
          ),
          body: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return  ref.watch(doctorCurrentScreenProvider.state).state ;
          },),
        ),
      ),
    );
  }
}
