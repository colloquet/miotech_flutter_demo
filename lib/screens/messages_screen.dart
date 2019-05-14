import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/widgets/message_list.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: MessageList(),
    );
  }
}
