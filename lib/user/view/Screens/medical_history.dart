import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_app/Login/google_login/is_new_user.dart';

import '../../../Login/google_login/sign_google.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

TextEditingController complaintController = TextEditingController();
TextEditingController durationController = TextEditingController();
TextEditingController attackController = TextEditingController();
TextEditingController increaseController = TextEditingController();
TextEditingController specialhabitsController = TextEditingController();
TextEditingController occupationController = TextEditingController();
TextEditingController familyHistoryController = TextEditingController();
TextEditingController pastHistoryControler = TextEditingController();

bool married = false;
final _formKey = GlobalKey<FormState>();
class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = 1000;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return AlertDialog(
      content: Scaffold(
          key: _scaffoldKey,
          backgroundColor: const Color(0xFFffffff),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: formKey, //key for form
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.01),
                      const Text(
                        "Please fill out this form",
                        style:
                            TextStyle(fontSize: 25, color: Color(0xFF363f93)),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter  data';
                              }
                              return null;
                            },
                            controller: complaintController,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 6,
                            minLines: 1,
                            decoration: const InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Complaint description /analysis',
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelStyle: const TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter  data';
                              }
                              return null;
                            },
                            controller: durationController,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 6,
                            minLines: 1,
                            decoration: const InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Duration',
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelStyle: const TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter  data';
                              }
                              return null;
                            },
                            controller: increaseController,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 6,
                            minLines: 1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'increase and decrease factors',
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter  data';
                              }
                              return null;
                            },
                            controller: attackController,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            minLines: 1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'date of last attack',
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //are you married?

                      CheckboxListTile(
                        title: const Text("Are you married?"), //    <-- label
                        value: married,
                        onChanged: (newValue) {
                          setState(() {
                            married = !married;
                          });
                        },
                      ),
                      ListTile(
                        title: const Text("What's your occupation?"),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter  data';
                              }
                              return null;
                            },
                            controller: occupationController,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            minLines: 1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'your occupation',
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text("Have you any special habits?"),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter  data';
                              }
                              return null;
                            },
                            controller: specialhabitsController,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            minLines: 1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'special habits',
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                            "What is your past history? (Disease - operative - Drugs)"),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter  data';
                              }
                              return null;
                            },
                            controller: pastHistoryControler,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            minLines: 1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'past history',
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text("What's your family history?"),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: familyHistoryController,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            minLines: 1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'family history',
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Center(
                          child: FloatingActionButton.extended(
                            backgroundColor: const Color(0XFF246EE9),
                            foregroundColor: Colors.black,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                CollectionReference user = FirebaseFirestore
                                    .instance
                                    .collection("usersData");
                                user.doc(userIdData).update({
                                  "History_Form": {
                                    "complaintController":
                                        complaintController.text,
                                    "durationController":
                                        durationController.text,
                                    "attackController": attackController.text,
                                    "increaseController":
                                        increaseController.text,
                                    "specialhabitsController":
                                        specialhabitsController.text,
                                    "occupationController":
                                        occupationController.text,
                                    "familyHistoryController":
                                        familyHistoryController.text,
                                    "pastHistoryController":
                                        pastHistoryControler.text,
                                    "married": married
                                  }
                                });
                              }
                              isNewUser( userCredentialDta , context);
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Save'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
