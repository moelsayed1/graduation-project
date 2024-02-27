
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_app/user/view/Screens/user_settings.dart';

import '../view/Screens/connect_with_doctore_screen.dart';
import '../view/Screens/search_screen_view.dart';
import '../view/Screens/user_home_screen.dart';
import '../view/Screens/user_profile.dart';



StateProvider  currentScreenProvider =
StateProvider((ref){
  return root[ref.watch(selectedScreenProvider.state).state]
  ["screen"]   ;
});

StateProvider selectedScreenProvider =
StateProvider<int>((ref){
  return 4 ;
});
List<Widget> screensIconList = [

  const Icon(Icons.home, color: Colors.white),
  const Icon(Icons.search, color: Colors.white),
  const Icon(Icons.health_and_safety, color: Colors.white),
  const Icon(Icons.settings, color: Colors.white),
  const Icon(Icons.person, color: Colors.white),

] ;
List<Map<String, Widget>> root = [
  {
    "screen":UserHomePage() ,
    "icon": const Icon(Icons.home_filled)
  },
  {
    "screen":SearchScreenView()  ,
    "icon": const Icon(Icons.search)
  },

  {
    "screen":ConnectWithDoctorePage() ,
    "icon": const Icon(Icons.perm_identity)
  },
  {
    "screen":SettingsPage() ,
    "icon": const Icon(Icons.settings)
  },
  {
    "screen":const UserProfile() ,
    "icon": const Icon(Icons.perm_identity)
  },

];
