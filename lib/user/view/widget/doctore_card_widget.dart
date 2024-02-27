import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:developer';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../v_call/pages/call_page.dart';
import '../../model/call_doctore_model.dart';

class DoctoreCardWidget extends StatelessWidget {
  late CallDoctorModel doctorDataModel ;
   DoctoreCardWidget({Key? key, required this.doctorDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 16),
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10.0),
            type: MaterialType.card,
            color: Colors.white,
            shadowColor: const Color(0xFFE9EAFF),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           CircleAvatar(
                            radius: 40,

                             child: Image.network(doctorDataModel.imageUrl),

                          ),
                           Expanded(
                            child: ListTile(
                              title: Text(doctorDataModel.name),
                              subtitle: Text(doctorDataModel.category),
                            ),
                          ),
                          IconButton(
                              onPressed: () {

                                OnJoin(context);
                              },
                              icon: Icon(Icons.video_call, color: Colors.green,size: 30,))
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  void OnJoin(context) {
      // await _handleCameraAndMic(Permission.camera);
      // await _handleCameraAndMic(Permission.microphone);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            role: ClientRole.Broadcaster,
            channelName:"mostafa_123456" ,
          ),
        ), // MaterialPageRoute
      );

  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    log(status.toString());
  }
}


