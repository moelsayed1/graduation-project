import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../navigator/navigator_provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 1500), (){});
    Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ref.watch(currentScreenProvider.state).state;
            },
          );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text('Healthcare', style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),

    );
  }
}
