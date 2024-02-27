
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_app/user/view/Screens/user_settings.dart';

import '../../Login/View/Screens/regestration/view/screen/doctor_registration.dart';
import '../../user/view/Screens/search_screen_view.dart';
import '../../user/view/Screens/user_profile.dart';
import '../view/Screens/doctor_home_screen.dart';
import '../view/Screens/doctor_profile.dart';
import '../view/Screens/request_page.dart';


StateProvider  doctorCurrentScreenProvider =
StateProvider((ref){
  return doctorRoot[ref.watch(doctorselectedScreenProvider.state).state]
  ["screen"]   ;
});

StateProvider doctorselectedScreenProvider =
StateProvider<int>((ref){
  return 0 ;
});
List<Widget> doctorScreensIconList = [

  const Icon(Icons.ten_k, color: Colors.white),

  const Icon(Icons.person, color: Colors.white),

] ;

List<Map<String, Widget>> doctorRoot = [
  {
    "screen":RequestPage() ,
    "icon": const Icon(Icons.ten_k)
  },
  {
    "screen":DoctorProfile() ,
    "icon": const Icon(Icons.perm_identity)
  },


];
