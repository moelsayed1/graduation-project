import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as rtc_local_view;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as rtc_remote_view;
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';


import '../utils/settings.dart';

class CallPage extends StatefulWidget {
  late final String channelName;
  late final ClientRole role;

  CallPage({Key? key, required this.channelName, required this.role})
      : super(key: key) ;

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
   List _users = <int>[];
  final _infostring = <String>[];
  bool muted = false;
  bool viewPanal = false;
  late RtcEngine _engine;
  @override
  void initState() {
    // await [Permission.camera,Permission.microphone].request();
    // TODO: implement initState
    initialize();
    super.initState();
  }
  @override
  void dispose() {
    _users.clear();
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

  Future<void> initialize() async {
    if (appId.isEmpty) {
      setState(() {
        _infostring.add("app Id not found");
      });
      return;
    }
   else{
      await [Permission.camera,Permission.microphone].request();
      _engine = await RtcEngine.create(appId);
      await _engine.enableVideo();
      await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
      await _engine.setClientRole(widget.role);
      _addAgoraEventHandlers();
      VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
      configuration.dimensions = VideoDimensions(width: 1920, height: 1080);
      await _engine.setVideoEncoderConfiguration(configuration);
      await _engine.joinChannel(token, widget.channelName, null, 0);
    }
  }

  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(
      error: (code) {
        setState(() {
          print("Error ***************************Error: ${code}") ;
          _infostring.add("Error: $code");
        });
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        setState(() {
          print("****************Channel name : $channel uid : $uid") ;
          _infostring.add("Channel name : $channel uid : $uid");
        });
      },
        leaveChannel: (state){
        _users.clear();
        },
      userJoined: (uid , elapsed){
        setState(() {
          final info = 'User Joined: $uid';
          _infostring.add(info);
          _users.add(uid);

        });
      },
      userOffline: ((uid,elapsed){
        setState(() {
          _users.remove(uid);
        });
      }),
      firstRemoteVideoFrame: (uid ,width,height,elapsed){
        setState(() {

        });
      }
    ));
  }

  Widget _viewRows() {
     List<StatefulWidget> list = [];
    if (widget.role == ClientRole.Broadcaster) {
      list.add( rtc_local_view.SurfaceView());
    }
    for (var uid in _users) {
      list.add(
          rtc_remote_view.SurfaceView(
        uid: uid,
        channelId: widget.channelName,
      ));
    }
     print ("************************> ${list.length}");
    return Column(
      children: List.generate(
        list.length,
        (index) => Expanded(
          child: Padding(padding: const EdgeInsets.all(5.0),
          child: list[index],
          ),
        ), // Expanded
      ), // List.generate
    ); // Column
  }

  Widget _toolbar() {
    if (widget.role == ClientRole.Audience) return const SizedBox();
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        RawMaterialButton(
          onPressed: () {
            setState(() {
              muted = !muted;
            });
            _engine.muteLocalAudioStream(muted);
          },
          child: Icon(
            muted ? Icons.mic_off : Icons.mic,
            color: muted ? Colors.white : Colors.blueAccent,
            size: 20.0,
          ), // Icon
          shape: const CircleBorder(),
          elevation: 2.0,
          fillColor: muted ? Colors.blueAccent : Colors.white,
          padding: const EdgeInsets.all(12),
        ),
        RawMaterialButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(
            Icons.call_end,
            color: Colors.white,
            size: 35.0,
          ), // Icon
          shape: const CircleBorder(),
          elevation: 2.0,
          fillColor: Colors.redAccent,
          padding: const EdgeInsets.all(15.0),
        ),
        RawMaterialButton(
          onPressed: () {
            _engine.switchCamera();
          },
          child: const Icon(
            Icons.switch_camera,
            color: Colors.blueAccent,
            size: 20.0,
          ), // Icon
          shape: const CircleBorder(),
          elevation: 2.0,
          fillColor: Colors.white,
          padding: const EdgeInsets.all(12.0),
        )
        // RawMaterialButton
      ] // RawMaterialButton
              ), // Row
    ); // Container
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Page"),
        centerTitle: true,
      ),
      backgroundColor: Colors.cyan,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child:  Stack(
            children: [
              _viewRows(),
              _toolbar(),
            ],
          ),
        ),
      )
    );
  }
}
