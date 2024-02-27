import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'doctor/view/Screens/doctor_profile.dart';
import 'navigator/navigator_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp((const ProviderScope(
    child: MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Scaffold(
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return ref.watch(currentScreenProvider.state).state;
          },
        ),
      ),
    );
  }
}
