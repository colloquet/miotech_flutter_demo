import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/models/conversation.dart';
import 'package:miotech_flutter_demo/models/message.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({this.conversation});
  final Conversation conversation;

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final messages = [
    Message(
      text: 'Me too!',
      isSelf: false,
      type: 'text',
    ),
    Message(
      image: AssetImage('assets/bg.jpg'),
      isSelf: false,
      type: 'image',
    ),
    Message(
      text: 'I love MioTech!',
      isSelf: true,
      type: 'text',
    ),
    Message(
      text: 'Hi',
      isSelf: false,
      type: 'text',
    ),
    Message(
      text: 'Hi',
      isSelf: true,
      type: 'text',
    ),
  ];

  int imageId = 0;

  Future sendImage(source) async {
    try {
      final image = await ImagePicker.pickImage(source: source);

      if (image != null) {
        var _message = Message(
          id: imageId++,
          image: FileImage(image),
          isSelf: true,
          type: 'image',
        );
        setState(() {
          messages.insert(0, _message);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  sendMessage(text) {
    if (text.trim() != '') {
      var _message = Message(
        text: text,
        isSelf: true,
        type: 'text',
      );
      setState(() {
        messages.insert(0, _message);
      });
      textEditingController.clear();
    }
    FocusScope.of(context).requestFocus(focusNode);
  }

  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.conversation.from),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: GestureDetector(
              onTap: () {
                focusNode.unfocus();
              },
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
                reverse: true,
                children: messages.map((message) {
                  return MessageItem(
                    message: message,
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            color: MioColors.fifth,
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
                                    sendImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.camera_alt),
                                  title: Text('Camera'),
                                  onTap: () {
                                    sendImage(ImageSource.camera);
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
                      color: MioColors.secondary,
                      size: 30.0,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: MioColors.fifth,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Message',
                          hintStyle: TextStyle(
                            color: MioColors.secondary.withOpacity(0.6),
                          ),
                        ),
                        controller: textEditingController,
                        focusNode: focusNode,
                        maxLines: 1,
                        textInputAction: TextInputAction.send,
                        onSubmitted: sendMessage,
                        cursorColor: MioColors.secondary,
                        style:
                            TextStyle(color: MioColors.primary, fontSize: 18.0),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      sendMessage(textEditingController.text);
                    },
                    child: Icon(
                      Icons.send,
                      color: MioColors.secondary,
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
  MessageItem({Key key, this.message}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        message.isImage
            ? ImageMessage(message: message)
            : TextMessage(message: message),
      ],
    );
  }
}

class TextMessage extends StatelessWidget {
  TextMessage({
    Key key,
    @required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: message.isSelf ? MioColors.primary : MioColors.fifth,
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        message.text,
        style: TextStyle(
            color: message.isSelf ? MioColors.background : MioColors.primary,
            fontSize: 16.0),
      ),
    );
  }
}

class ImageMessage extends StatelessWidget {
  const ImageMessage({
    Key key,
    @required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: PhotoView(
                    transitionOnUserGestures: true,
                    imageProvider: message.image,
                    heroTag: 'image-' + message.id.toString(),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered,
                    onTapUp: (context, detail, value) {
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: MioColors.fifth,
            borderRadius: BorderRadius.circular(4.0),
          ),
          margin: EdgeInsets.symmetric(vertical: 4.0),
          child: SizedBox(
            width: 150.0,
            child: Hero(
              tag: 'image-' + message.id.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image(image: message.image),
              ),
            ),
          ),
        ));
  }
}
