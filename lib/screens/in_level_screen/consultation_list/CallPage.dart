

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CallPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child:   Text(
          'قريبا',
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
              color: Colors.black)),
    );
  }
}

// import 'dart:convert';
// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:aphaa_app/helper/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// class VideoCall extends StatefulWidget {
//   String channelName = "test";
//
//   VideoCall({required this.channelName});
//   @override
//   _VideoCallState createState() => _VideoCallState();
// }
//
// class _VideoCallState extends State<VideoCall> {
//   late final AgoraClient _client;
//   bool _loading = false;
//   String tempToken = "";
//
//   @override
//   void initState() {
//     getToken();
//     super.initState();
//   }
//
//   Future<void> getToken() async {
//     String link =
//         "https://agora-node-tokenserver-1.davidcaleb.repl.co/access_token?channelName=${widget.channelName}";
//
//     // Response _response = await get(Uri.parse(link));
//     // Map data = jsonDecode(_response.body);
//     // setState(() {
//     //   tempToken = data["token"];
//     // });
//     _client = AgoraClient(
//         agoraConnectionData: AgoraConnectionData(
//           appId: appId,
//           tempToken: token,
//           channelName: widget.channelName,
//         ),
//         enabledPermission: [Permission.camera, Permission.microphone]);
//
//     await _client.initialize();
//     // Future.delayed(const Duration(seconds: 1)).then(
//     //       (value) => setState(() => _loading = false),
//     // );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: _loading
//             ? const Center(
//           child: CircularProgressIndicator(),
//         )
//             : Stack(
//           children: [
//             AgoraVideoViewer(
//               client: _client,
//             ),
//             AgoraVideoButtons(client: _client)
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
// /*import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:aphaa_app/helper/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class CallPage extends StatefulWidget {
//
//
//    CallPage();
//
//
//   @override
//   _CallPageState createState() => _CallPageState();
// }
//
// class _CallPageState extends State<CallPage> {
//   bool muted = false;
//
//   int uid = 0;
//   // uid of the local user
//   int? _remoteUid;
//   // uid of the remote user
//   bool _isJoined = false;
//
//   late RtcEngine agoraEngine;
//
//
//   @override
//   void dispose() async {
//     await agoraEngine.leaveChannel();
//     agoraEngine.release();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     setupVideoSDKEngine();
//   }
//
//   Future<void> setupVideoSDKEngine() async {
//     // retrieve or request camera and microphone permissions
//     await [Permission.microphone, Permission.camera].request();
//
//     //create an instance of the Agora engine
//     agoraEngine = createAgoraRtcEngine();
//     await agoraEngine.initialize(const RtcEngineContext(
//         appId: appId
//     ));
//
//     await agoraEngine.enableVideo();
//
//     // Register the event handler
//     agoraEngine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//           // showMessage("Local user uid:${connection.localUid} joined the channel");
//           setState(() {
//             _isJoined = true;
//           });
//         },
//         onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//           // showMessage("Remote user uid:$remoteUid joined the channel");
//           setState(() {
//             _remoteUid = remoteUid;
//           });
//         },
//         onUserOffline: (RtcConnection connection, int remoteUid,
//             UserOfflineReasonType reason) {
//           // showMessage("Remote user uid:$remoteUid left the channel");
//           setState(() {
//             _remoteUid = null;
//           });
//         },
//       ),
//     );
//   }
//
//
//
//
//   /// Toolbar layout
//   Widget _toolbar() {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       padding: const EdgeInsets.symmetric(vertical: 48),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           RawMaterialButton(
//             onPressed: _onToggleMute,
//             child: Icon(
//               muted ? Icons.mic_off : Icons.mic,
//               color: muted ? Colors.white : Colors.blueAccent,
//               size: 20.0,
//             ),
//             shape: CircleBorder(),
//             elevation: 2.0,
//             fillColor: muted ? Colors.blueAccent : Colors.white,
//             padding: const EdgeInsets.all(12.0),
//           ),
//           RawMaterialButton(
//             onPressed: () => _onCallEnd(context),
//             child: Icon(
//               Icons.call_end,
//               color: Colors.white,
//               size: 35.0,
//             ),
//             shape: CircleBorder(),
//             elevation: 2.0,
//             fillColor: Colors.redAccent,
//             padding: const EdgeInsets.all(15.0),
//           ),
//           RawMaterialButton(
//             onPressed: _onSwitchCamera,
//             child: Icon(
//               Icons.switch_camera,
//               color: Colors.blueAccent,
//               size: 20.0,
//             ),
//             shape: CircleBorder(),
//             elevation: 2.0,
//             fillColor: Colors.white,
//             padding: const EdgeInsets.all(12.0),
//           )
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // scaffoldMessengerKey: scaffoldMessengerKey,
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Get started with Video Calling'),
//           ),
//           body: ListView(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//             children: [
//               // Container for the local video
//               Container(
//                 height: 240,
//                 decoration: BoxDecoration(border: Border.all()),
//                 child: Center(child: _localPreview()),
//               ),
//               const SizedBox(height: 10),
//               //Container for the Remote video
//               Container(
//                 height: 240,
//                 decoration: BoxDecoration(border: Border.all()),
//                 child: Center(child: _remoteVideo()),
//               ),
//               // Button Row
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: _isJoined ? null : () => {join()},
//                       child: const Text("Join"),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: _isJoined ? () => {leave()} : null,
//                       child: const Text("Leave"),
//                     ),
//                   ),
//                 ],
//               ),
//               // Button Row ends
//             ],
//           )),
//     );
//   }
//
// // Display local video preview
//   Widget _localPreview() {
//     if (_isJoined) {
//       return AgoraVideoView(
//         controller: VideoViewController(
//           rtcEngine:  agoraEngine,
//           canvas: VideoCanvas(uid: 0),
//         ),
//       );
//     } else {
//       return const Text(
//         'Join a channel',
//         textAlign: TextAlign.center,
//       );
//     }
//   }
//
// // Display remote user's video
//   Widget _remoteVideo() {
//     if (_remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine:  agoraEngine,
//           canvas: VideoCanvas(uid: _remoteUid),
//           connection: RtcConnection(channelId: channelName),
//         ),
//       );
//     } else {
//       String msg = '';
//       if (_isJoined) msg = 'Waiting for a remote user to join';
//       return Text(
//         msg,
//         textAlign: TextAlign.center,
//       );
//     }
//   }
//
//
//
//   /// Video view wrapper
//   Widget _videoView(view) {
//     return Expanded(child: Container(child: view));
//   }
//
//   /// Video view row wrapper
//   Widget _expandedVideoRow(List<Widget> views) {
//     final wrappedViews = views.map<Widget>(_videoView).toList();
//     return Expanded(
//       child: Row(
//         children: wrappedViews,
//       ),
//     );
//   }
//
//
//
//   void _onCallEnd(BuildContext context) {
//     Navigator.pop(context);
//   }
//
//   void _onToggleMute() {
//     setState(() {
//       muted = !muted;
//     });
//     agoraEngine.muteLocalAudioStream(muted);
//   }
//
//   void _onSwitchCamera() {
//     agoraEngine.switchCamera();
//   }
//   void  join() async {
//     await agoraEngine.startPreview();
//
//     // Set channel options including the client role and channel profile
//     ChannelMediaOptions options = const ChannelMediaOptions(
//       clientRoleType: ClientRoleType.clientRoleBroadcaster,
//       channelProfile: ChannelProfileType.channelProfileCommunication,
//     );
//
//     await agoraEngine.joinChannel(
//       token: token,
//       channelId: channelName,
//       options: options,
//       uid: uid,
//     );
//   }
//
//   void leave() {
//     setState(() {
//       _isJoined = false;
//       _remoteUid = null;
//     });
//     agoraEngine.leaveChannel();
//   }
// }
// */