
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../Login/google_login/is_new_user.dart';
import '../../../Login/google_login/sign_google.dart';
import '../../../user/model/user_model.dart';
import '../../../user/view/Screens/user_profile.dart';
import 'doctor_home_screen.dart';

late String selectedUserId ;
class RequestPage extends StatelessWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("request page"),
        actions: [
          TextButton.icon(
              onPressed: () {
                signOut(context);
              },
              icon: const Icon(Icons.arrow_back,color: Colors.white,),
              label: const Text("sign out",style: TextStyle(color: Colors.white),)),
        ],
        leading: Container(
            height: 50,
            width: 50,
            child: Image.network(
              currentDoctorModelData.imageUrl,
              fit: BoxFit.fill,
            )),
      ) ,
      body: ListView.builder(
        itemCount: currentDoctorModelData.requestList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: ()async{
              selectedUserId =   currentDoctorModelData.requestList[index]['userId'];
              await FirebaseFirestore.instance.collection("usersData").doc(currentDoctorModelData.requestList[index]['userId']).get()
                  .then((DocumentSnapshot documentSnapshot)  {
                userDataModel= UserModel.fromMap(documentSnapshot); } );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  UserProfile()),


              );
            },
            child: Card(
                child: Row(
                  children: [
                    CircleAvatar(
                        child: Image.network(
                          currentDoctorModelData.requestList[index]['userModelData']["imageUrl"],
                        )),
                    Expanded(
                      child: ListTile(
                        title: Text("client name"),
                        subtitle: Text(currentDoctorModelData.requestList[index]['userModelData']['name']),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text("client note"),
                        subtitle: Text(currentDoctorModelData.requestList[index]['note']),
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}


