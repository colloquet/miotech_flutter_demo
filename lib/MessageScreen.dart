import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final conversation;
  MessageScreen({this.conversation});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  var messages = [
    {
      'text': 'I love MioTech!',
      'isSelf': true,
    },
    {
      'text': 'Hi',
      'isSelf': false,
    },
    {
      'text': 'Hi',
      'isSelf': true,
    },
  ];

  final FocusNode focusNode = new FocusNode();
  final TextEditingController textEditingController = new TextEditingController();

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
                  return MessageItem(text: message['text'], isSelf: message['isSelf']);
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
                  Icon(
                    Icons.add_circle_outline,
                    color: Color(0xff8ca0b3),
                    size: 24.0,
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff1e2534),
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        autofocus: true,
                        maxLines: 1,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (text) {
                          setState(() {
                            messages.insert(0, {
                              'text': text,
                              'isSelf': true,
                            });
                          });
                          textEditingController.clear();
                          FocusScope.of(context).requestFocus(focusNode);
                        },
                        cursorColor: Color(0xff8ca0b3),
                        style: TextStyle(color: Color(0xffe7e7e7)),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.send,
                    color: Color(0xff8ca0b3),
                    size: 24.0,
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
  const MessageItem({Key key, this.isSelf, this.text}) : super(key: key);
  final String text;
  final bool isSelf;

  @override
  Widget build(BuildContext context) {
    var _backgroundColor = isSelf ? Color(0xffe7e7e7) : Color(0xff1e2534);
    var _textColor = isSelf ? Color(0xff121927) : Color(0xffe7e7e7);

    return Row(
      mainAxisAlignment:
          isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.symmetric(vertical: 4.0),
          child: Text(text, style: TextStyle(color: _textColor, fontSize: 16.0)),
        ),
      ],
    );
  }
}
