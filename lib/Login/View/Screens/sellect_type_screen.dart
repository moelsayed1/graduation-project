import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:med_app/Login/View/Screens/regestration/view/screen/doctor_registration.dart';
import 'package:med_app/Login/View/Screens/regestration/view/screen/user_registration.dart';

import '../../../navigator/navigator_provider.dart';

class SelecttypeScreen extends StatelessWidget {
  late String _userId ;
   SelecttypeScreen({Key? key,required String  userID}) : super(key: key){
     _userId =userID ;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          child: Image.asset(
            'images/med.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: IntrinsicHeight(
            child: Column(
              children: [
                SelectTypeButton(
                    icon: Icons.medical_services, lable: "Register as doctor",selectedPage: RegisterDoctorPage(
                  userID: _userId,)),
                SelectTypeButton(icon: Icons.person, lable: "Register as patient",selectedPage: RegisterUserPage(),)
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class SelectTypeButton extends StatelessWidget {
  late String _lable;
  late IconData _icon;
  late Widget _selectedPage;
  SelectTypeButton({Key? key, required String lable, required IconData icon,required Widget selectedPage})
      : super(key: key) {
    _icon = icon;
    _lable = lable;
    _selectedPage =selectedPage;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return  ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => _selectedPage));
             // ref.watch(currentScreen.state).state = _selectedPage ;
            }, icon: Icon(_icon), label: Text(_lable));
      },
    );
  }
}
