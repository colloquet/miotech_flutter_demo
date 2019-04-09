import 'package:flutter/material.dart';

class Message {
  Message({this.id, this.text, this.isSelf, this.type, this.image});
  int id;
  String text;
  bool isSelf;
  String type;
  ImageProvider image;

  bool get isImage {
    return type == 'image';
  }
}