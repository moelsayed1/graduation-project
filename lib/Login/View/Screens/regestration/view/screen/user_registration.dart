import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../theme.dart';
import '../../../../../../user/model/user_model.dart';
import '../../../../../../user/provider/add_user_data_to_firebase_provider.dart';
import '../../../../../../user/view/Screens/user_home_screen.dart';
import '../../../../../google_login/is_new_user.dart';
import '../../../../../google_login/sign_google.dart';
import '../../../../widgets/custom_check_box.dart';
import '../../../../widgets/custom_primary_button.dart';
import '../widgets/text_form_view.dart';

late String _type;

class RegisterUserPage extends StatelessWidget {
  RegisterUserPage({Key? key}) : super(key: key);
  final _tFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController step1Controller = TextEditingController();
  TextEditingController step2Controller = TextEditingController();
  TextEditingController step3Controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF585CE5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Register as A patient',
                      style: heading2.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      'Register New Your Account',
                      style: TextStyle(
                        color: Colors.cyan,
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
                const SizedBox(
                  height: 25,
                ),
                Form(
                  key: _tFormKey,
                  child: Column(
                    children: [
                      EnterDataTextFormFiled(
                        controller: nameController,
                        textInputType: TextInputType.name,
                        validator: validateName,
                        icon: Icons.person,
                        labelText: 'add your name ',
                      ),
                      EnterDataTextFormFiled(
                        controller: phoneController,
                        textInputType: TextInputType.phone,
                        validator: validateMobile,
                        icon: Icons.phone,
                        labelText: 'add your mobile ',
                      ),
                      EnterDataTextFormFiled(
                        controller: addressController,
                        textInputType: TextInputType.streetAddress,
                        validator: validateAddress,
                        icon: Icons.location_on,
                        labelText: 'add your address ',
                      ),
                      EnterDataTextFormFiled(
                        controller: ageController,
                        textInputType: TextInputType.number,
                        validator: validateage,
                        icon: Icons.calendar_today_outlined,
                        labelText: 'add your age ',
                      ),
                      EnterDataTextFormFiled(
                        controller: weightController,
                        textInputType: TextInputType.number,
                        validator: validateWeight,
                        icon: Icons.calendar_today_outlined,
                        labelText: 'add your weight ',
                      ),
                      EnterDataTextFormFiled(
                        controller: heightController,
                        textInputType: TextInputType.number,
                        validator: validateWeight,
                        icon: Icons.calendar_today_outlined,
                        labelText: 'add your height ',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomCheckbox(),
                          const SizedBox(
                            width: 12,
                          ),
                          Consumer(
                            builder: (BuildContext context, WidgetRef ref,
                                Widget? child) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'By creating an account, you agree to our',
                                    style: regular16pt.copyWith(
                                        color: ref
                                                .watch(isAcceptedProvider.state)
                                                .state
                                            ? Colors.cyan
                                            : Colors.red),
                                  ),
                                  Text(
                                    'Terms & Conditions',
                                    style: regular16pt.copyWith(
                                        color: ref
                                                .watch(isAcceptedProvider.state)
                                                .state
                                            ? Colors.cyan
                                            : Colors.red),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //isCheckedProvider
                      //
                      Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          return CustomPrimaryButton(
                            buttonColor: Colors.white,
                            textValue: 'Register',
                            textColor: Colors.blue,
                            onPressed: () {
                              if (ref.watch(isCheckedProvider.state).state ==
                                      true &&
                                  _tFormKey.currentState!.validate()) {
                                ref.watch(isAcceptedProvider.state).state =
                                    true;
                            Future<void>  x=  addUserDataToFireBase(
                                    uID: userCredentialData.uid,
                                    userData: UserModel(
                                      age: double.parse(ageController.text),
                                      height:
                                          double.parse(heightController.text),
                                      address: addressController.text,
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      weight:
                                          double.parse(weightController.text),
                                      email: userCredentialData.email!,
                                      imageUrl: userCredentialData.photoURL!,
                                      isDoctor: false, doctorList: [],
                                      medicalHistory: [],
                                      medicalForm:{
                                        "complaintController":
                                        " no data",
                                        "durationController":
                                        " no data",
                                        "attackController": " no data",
                                        "increaseController":
                                        " no data",
                                        "specialhabitsController":
                                        " no data",
                                        "occupationController":
                                        " no data",
                                        "familyHistoryController":
                                        " no data",
                                        "pastHistoryController":
                                        " no data",
                                        "married": false
                                    },
                                    ).UserModeltoMap());

                                userIdData = userCredentialData.uid;
                                SignInWithGoogle( context)
                      ;

                              } else {
                                _tFormKey.currentState!.validate();
                                ref.watch(isAcceptedProvider.state).state =
                                    false;
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
