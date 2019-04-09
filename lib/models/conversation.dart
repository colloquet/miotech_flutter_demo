import 'package:flutter/material.dart';

class Conversation {
  Conversation({
    this.id,
    this.from,
    this.color,
    this.latestMessage,
  });

  final int id;
  final String from;
  final Color color;
  final String latestMessage;
}
