import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_app/user/view/Screens/user_home_screen.dart';

import '../../../Login/google_login/is_new_user.dart';
import '../../../doctor/view/Screens/doctor_home_screen.dart';
import '../../../doctor/view/Screens/request_page.dart';
import '../../../doctor/view/widgets/add_notes_to_doctore.dart';
import '../../../v_call/pages/call_page.dart';
import '../widget/book_form.dart';
import 'medical_history.dart';
import 'package:med_app/user/view/widget/doctore_card_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
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
                                image: NetworkImage(userDataModel.imageUrl))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.green,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                if (isDoctore)
                  Container(
                    height: 150,
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                OnJoin(context);
                              },
                              icon: Icon(
                                Icons.video_call,
                                color: Colors.green,
                                size: 30,
                              )),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AddNote(
                                        pationtId: selectedUserId,
                                        doctorName: DoctorDataModelLogin.name,
                                      ));
                            },
                            child: const Text("add notes",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const UserHomePage()),
                              );
                            },
                            child: const Text("View patient rate",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        )

                      ],
                    ),
                  )
                else
                  TextButton.icon(
                      onPressed: () {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Home());
                      },
                      icon: Icon(Icons.add_outlined),
                      label: Text(" Add your Medical History")),
                buildTextField("Full Name", userDataModel.name, false),
                buildTextField("E-mail", userDataModel.email, false),
                buildTextField("Address", userDataModel.address, false),
                buildTextField("Phone", userDataModel.phone, false),
                buildTextField("Age", userDataModel.age.toString(), false),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "Medical History",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 35,
                ),
                Column(
                  children: [
                    buildTextField(
                        "complaintController",
                        userDataModel.medicalForm["complaintController"],
                        false),
                    buildTextField("increase Controller",
                        userDataModel.medicalForm["increaseController"], false),
                    buildTextField("increase Controller",
                        userDataModel.medicalForm["increaseController"], false),
                    buildTextField(
                        "familyHistoryController",
                        userDataModel.medicalForm["familyHistoryController"],
                        false),
                    buildTextField("attackController",
                        userDataModel.medicalForm["attackController"], false),
                    buildTextField("married",
                        userDataModel.medicalForm["married"].toString(), false),
                    buildTextField(
                        "occupationController",
                        userDataModel.medicalForm["occupationController"],
                        false),
                    buildTextField(
                        "pastHistoryController",
                        userDataModel.medicalForm["pastHistoryController"],
                        false),
                    buildTextField(
                        "pastHistoryController",
                        userDataModel.medicalForm["pastHistoryController"],
                        false),
                  ],
                )
              ]))),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        enabled: false,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           children: [
//             Image.network(
//               userDataModel.imageUrl,
//               height: 90,
//               width: 90,
//             ),
//             SizedBox(width: 60,),
//             TextButton.icon(
//                 onPressed: () {
//                   showDialog<String>(
//                       context: context,
//                       builder: (BuildContext context) => Home());
//                 },
//                 icon: Icon(Icons.add_outlined),
//                 label: Text(" Add your Medical History"))
//           ],
//         ),
//         SizedBox(height: 20,),
//         Row(
//           children: [
//             Expanded(
//               child: ListTile(
//                 title: Text("user name"),
//                 subtitle: Text(userDataModel.name),
//               ),
//             ),
//             Expanded(
//               child: ListTile(
//                 title: Text("user phone"),
//                 subtitle: Text(userDataModel.phone),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: ListTile(
//                 title: Text("user email"),
//                 subtitle: Text(userDataModel.email),
//               ),
//             ),
//             Expanded(
//               child: ListTile(
//                 title: Text("user address"),
//                 subtitle: Text(userDataModel.address),
//               ),
//             ),
//           ],
//         ),
// Row(
//     children: [
//       Expanded(
//         child: ListTile(
//           title: Text("user age "),
//           subtitle: Text(userDataModel.age.toInt().toString()),
//         ),
//       ),
//       ]),
//         SizedBox(height: 5,),
//         Container(
//           color: Colors.black,
//           height: 1,
//           width: double.infinity,
//         ),
//         SizedBox(height: 5,),
//         const Text(
//           "medical history",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         Container(
//           height: 1000,
//           child: ListView.builder(
//             itemCount: userDataModel.medicalHistory.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Card(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                               child: ListTile(
//                             title: Text("doctor name"),
//                             subtitle: Text(userDataModel.medicalHistory[index]
//                                 ["doctorName"]),
//                           )),
//                           Expanded(
//                               child: ListTile(
//                             title: Text("date"),
//                             subtitle: Text(
//                                 userDataModel.medicalHistory[index]["date"]),
//                           )),
//                         ],
//                       ),
//                       ListTile(
//                         title: Text("note"),
//                         subtitle:
//                             Text(userDataModel.medicalHistory[index]["note"]),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     ),
//         ),
//       ),
//     );
//   }
// }

void OnJoin(context) {
  // await _handleCameraAndMic(Permission.camera);
  // await _handleCameraAndMic(Permission.microphone);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CallPage(
        role: ClientRole.Broadcaster,
        channelName: "mahmoud_123456",
      ),
    ), // MaterialPageRoute
  );
}
