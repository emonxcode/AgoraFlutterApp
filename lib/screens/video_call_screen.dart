import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: '0ef769db7f5a4de38d53de655363540f',
      channelName: 'femon',
      tempToken:
          '007eJxTYPgg5x456X7ku8htzgXfLu7M154hPMlizrRpvozXX7Gv8JRTYDBITTM3s0xJMk8zTTRJSTW2SDE1Tkk1MzU1NjM2NTFI+zelKq0hkJGBVaqChZEBAsF8hrTU3Pw8BgYAg34fhg==',
  
    ),
  );

  Future<void> _initializeAgora() async {
    await _client.initialize();
  }

  @override
  void initState() {
    _initializeAgora();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: _client,
                showNumberOfUsers: true,
                layoutType: Layout.floating,
              ),
              AgoraVideoButtons(client: _client)
            ],
          ),
        ),
      ),
    );
  }
}
