import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Login/View/Screens/login_page.dart';


StateProvider <Widget> currentScreenProvider = StateProvider<Widget>((ref)=> LoginPage());
StateProvider <Widget> nitScreenProvider = StateProvider<Widget>((ref)=> ref.watch(currentScreenProvider.state).state);// add reg screen widget