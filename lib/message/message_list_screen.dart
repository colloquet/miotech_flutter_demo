import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/message/message_list.dart';

class MessageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: MessageList(),
    );
  }
}
