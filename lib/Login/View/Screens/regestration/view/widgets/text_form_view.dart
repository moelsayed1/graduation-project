import 'package:flutter/material.dart';

import '../../../../../../theme.dart';

class EnterDataTextFormFiled extends StatelessWidget {
  late TextEditingController _controller;
  late IconData _icon;
  late String _labelText;
  late TextInputType _textInputType;
  late FormFieldValidator<String> _validator;
  EnterDataTextFormFiled({
    Key? key,
    required String labelText,
    required TextEditingController controller,
    required IconData icon,
    required TextInputType textInputType,
    required FormFieldValidator<String> validator,
  }) : super(key: key) {
    _validator = validator;
    _labelText = labelText;
    _controller = controller;
    _textInputType = textInputType;
    _icon = icon;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: TextFormField(
            keyboardType: _textInputType,
            validator: _validator,
            textDirection: TextDirection.ltr,
            controller: _controller,
            decoration: InputDecoration(
              labelStyle: heading6.copyWith(color: textGrey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: Icon(_icon),
              labelText: _labelText,
            ),
          ),
        ),
      ),
    );
  }
}

// mobile validate
String? validateMobile(value) {
  String patttern = r'(^(?:[0]1)?[0-9]{11}$)';
  RegExp regExp = RegExp(patttern);
  if (value.length == 0) {
    return 'من فضلك ادخل رقم الهاتف';
  } else if (!regExp.hasMatch(value)) {
    return 'ادخل رقم هاتف صحيح';
  }
  return null;
}

// name validate
String? validateName(val) {
  if (val.length < 3) {
    return "name should be more than 3 character ";
  } else {
    return null;
  }
}

String? validateAddress(val) {
  if (val.length < 3) {
    return "please add all address ";
  } else {
    return null;
  }
}

String? validateage( val) {
  if(val.isEmpty){
    return "please enter an age ";
  }
  if (double.parse(val) <= 100 && double.parse(val) >= 20  ) {
    return null;
  } else {
    return "please enter age from 20 to 100";
  }
}
String? validateWeight( val) {
  if(val.isEmpty){
    return "please enter your Weight ";
  }
  if (double.parse(val) <= 200 && double.parse(val) >= 40  ) {
    return null;
  } else {
    return "please enter age from 40 to 200";
  }
}