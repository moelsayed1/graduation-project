import 'package:flutter/material.dart';
import 'package:med_app/Login/View/Screens/regestration/view/screen/doctor_registration.dart';
import '../../../Login/google_login/is_new_user.dart';
import '../../../Login/google_login/sign_google.dart';
import 'doctor_home_screen.dart';


class DoctorProfile extends StatelessWidget {
  const DoctorProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          TextButton.icon(
              onPressed: () {
                signOut(context);
              },
              icon: const Icon(Icons.arrow_back,color: Colors.white,),
              label: const Text("sign out",style: TextStyle(color: Colors.white),)),
        ],
       title: Text("Welcome ${currentDoctorModelData.name}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color:
                        Theme.of(context).scaffoldBackgroundColor),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 10))
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(currentDoctorModelData.imageUrl))),
              ),
            ),
            SizedBox(height: 15 ,),
            Text("doctor name: ${currentDoctorModelData.name}"),
            Text("doctor phone: ${currentDoctorModelData.phone}"),
            Text("doctor email: ${currentDoctorModelData.email}"),
            Text("doctor address: ${currentDoctorModelData.address}"),

          ],
        ),
      ),
    );
  }
}
