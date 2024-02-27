import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../doctor/model/doctor_model.dart';
import '../../../../../../doctor/provider/add_doctore_to_firebase.dart';
import '../../../../../../doctor/view/Screens/doctor_home_screen.dart';
import '../../../../../../theme.dart';
import '../../../../../google_login/is_new_user.dart';
import '../../../../../google_login/sign_google.dart';
import '../../../../widgets/custom_primary_button.dart';
import '../widgets/text_form_view.dart';
CollectionReference usersCollection =
FirebaseFirestore.instance.collection("usersData");
class RegisterDoctorPage extends StatelessWidget {
  late String _userId; // => google account Id for doctor
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RegisterDoctorPage({Key? key, required String userID}) : super(key: key) {
    _userId = userID;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF585CE5),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register as A doctor',
                        style: heading2.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        'Register Your New Account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'images/accent.png',
                        width: 99,
                        height: 4,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EnterDataTextFormFiled(
                      controller: nameController,
                      textInputType: TextInputType.streetAddress,
                      validator: validateName,
                      icon: Icons.location_history_rounded,
                      labelText: 'add your name ',
                    ),
                    EnterDataTextFormFiled(
                      controller: phoneController,
                      textInputType: TextInputType.phone,
                      validator: validateMobile,
                      icon: Icons.phone,
                      labelText: 'add your phone',
                    ),
                    EnterDataTextFormFiled(
                      controller: addressController,
                      textInputType: TextInputType.streetAddress,
                      validator: validateName,
                      icon: Icons.location_on,
                      labelText: 'add your address ',
                    ),
                    EnterDataTextFormFiled(
                      controller: categoryController,
                      textInputType: TextInputType.streetAddress,
                      validator: validateName,
                      icon: Icons.medical_services,
                      labelText: 'add your Category ',
                    ),
                    Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                      return  Padding(
                        padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: CustomPrimaryButton(
                          buttonColor: Colors.white,
                          textValue: 'Register',
                          textColor: Colors.black,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              adddoctoreDataToFireBase(
                                  uID: userCredentialData.uid,
                                  DoctorModel: DoctorModel(
                                      email: userCredentialData.email!,
                                      category: categoryController.text,
                                      address: addressController.text,
                                      imageUrl: userCredentialData.photoURL!,
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      isDoctor: true, requestList: [])
                                      .toMap()).then((valio)async {
                               // DoctorModel  cDoctoreModel =  DoctorModel.fromMap(await usersCollection.doc(_userId).get());

                                SignInWithGoogle( context);
                              });


                            }





                          }

                        ),
                      );
                    },

                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
