import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view_model/doctore_List_view_model.dart';

class ConnectWithDoctorePage extends StatelessWidget {
  const ConnectWithDoctorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
      child: Column(
        children: const [
          Text(
            "Doctors",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          DoctoreListVM(),
        ],
      ),
    );
  }
}
