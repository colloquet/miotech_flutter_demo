import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class MessageScreen extends StatefulWidget {
  final conversation;

  MessageScreen({this.conversation});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  var messages = [
    {
      'text': 'Me too!',
      'isSelf': false,
      'type': 'text',
    },
    {
      'image': AssetImage('assets/bg.jpg'),
      'isSelf': false,
      'type': 'image',
    },
    {
      'text': 'I love MioTech!',
      'isSelf': true,
      'type': 'text',
    },
    {
      'text': 'Hi',
      'isSelf': false,
      'type': 'text',
    },
    {
      'text': 'Hi',
      'isSelf': true,
      'type': 'text',
    },
  ];

  int imageId = 0;

  Future sendImageFromGallery() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          messages.insert(0, {
            'id': imageId++,
            'image': FileImage(image),
            'isSelf': true,
            'type': 'image',
          });
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future sendImageFromCamera() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);

      if (image != null) {
        setState(() {
          messages.insert(0, {
            'id': imageId++,
            'image': FileImage(image),
            'isSelf': true,
            'type': 'image',
          });
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  sendMessage(text) {
    if (text.trim() != '') {
      setState(() {
        messages.insert(0, {
          'text': text,
          'isSelf': true,
          'type': 'text',
        });
      });
      textEditingController.clear();
    }
    FocusScope.of(context).requestFocus(focusNode);
  }

  final FocusNode focusNode = new FocusNode();
  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.conversation['from']),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: GestureDetector(
              onTap: () {
                focusNode.unfocus();
              },
              child: ListView(
                padding: EdgeInsets.all(16.0),
                reverse: true,
                children: messages.map((message) {
                  return MessageItem(
                      message: message, isSelf: message['isSelf']);
                }).toList(),
              ),
            ),
          ),
          Container(
            color: Color(0xff1e2534),
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).padding.bottom),
                            child: Wrap(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.image),
                                  title: Text('Photo album'),
                                  onTap: () {
                                    sendImageFromGallery();
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.camera_alt),
                                  title: Text('Camera'),
                                  onTap: () {
                                    sendImageFromCamera();
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.add,
                      color: Color(0xff8ca0b3),
                      size: 30.0,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff1e2534),
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Message',
                          hintStyle: TextStyle(color: Color(0x998ca0b3)),
                        ),
                        controller: textEditingController,
                        focusNode: focusNode,
                        autofocus: true,
                        maxLines: 1,
                        textInputAction: TextInputAction.send,
                        onSubmitted: sendMessage,
                        cursorColor: Color(0xff8ca0b3),
                        style:
                            TextStyle(color: Color(0xffe7e7e7), fontSize: 18.0),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      sendMessage(textEditingController.text);
                    },
                    child: Icon(
                      Icons.send,
                      color: Color(0xff8ca0b3),
                      size: 28.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({Key key, this.isSelf, this.message}) : super(key: key);
  final Map message;
  final bool isSelf;

  @override
  Widget build(BuildContext context) {
    var _backgroundColor = isSelf && message['type'] != 'image' ? Color(0xffe7e7e7) : Color(0xff1e2534);
    var _textColor = isSelf ? Color(0xff121927) : Color(0xffe7e7e7);
    var _padding = message['type'] == 'image'
        ? EdgeInsets.all(0.0)
        : EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0);

    return Row(
      mainAxisAlignment:
          isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
          padding: _padding,
          margin: EdgeInsets.symmetric(vertical: 4.0),
          child: message['type'] == 'image'
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondAnimation) {
                          return FadeTransition(
                            opacity: animation,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: PhotoView(
                                transitionOnUserGestures: true,
                                imageProvider: message['image'],
                                heroTag: 'image-' + message['id'].toString(),
                                minScale: PhotoViewComputedScale.contained,
                                maxScale: PhotoViewComputedScale.covered,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 150.0,
                    child: Hero(
                      tag: 'image-' + message['id'].toString(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image(image: message['image']),
                      ),
                    ),
                  ))
              : Text(
                  message['text'],
                  style: TextStyle(color: _textColor, fontSize: 16.0),
                ),
        ),
      ],
    );
  }
}
