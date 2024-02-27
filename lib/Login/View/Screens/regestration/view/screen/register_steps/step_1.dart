import 'package:flutter/material.dart';

import '../../widgets/text_form_view.dart';

class Step1 extends StatelessWidget {
  Step1({Key? key}) : super(key: key);
  final _tFormKey = GlobalKey<FormState>();
  TextEditingController step1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(child: Padding(
    padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Form(
    key: _tFormKey,
    child: Column(
    children: [
    EnterDataTextFormFiled(
    controller: step1Controller,
    textInputType: TextInputType.text,
    validator: validateName,
    icon: Icons.person_remove_alt_1_sharp,
    labelText: 'add your result ',
    ),
    ],))])))));
  }
  }
