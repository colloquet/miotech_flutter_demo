import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/screens/message_screen.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/models/conversation.dart';

var _names = [
  'Zonia Sedlak',
  'Lisbeth Sinha',
  'Janiece Atterbury',
  'Esteban Hosey',
  'Alejandrina Samford',
  'Nicol Rhinehart',
  'Trevor Moronta',
  'Cristy Vanscyoc',
  'Lawanna Ertel',
  'Jaimie Ferrara',
];

var _backgroundColors = [
  Color(0xff4C7863),
  Color(0xff12918B),
  Color(0xffAF6D40),
  Color(0xffA5801D),
  Color(0xff905959),
  Color(0xff6F5BA2),
  Color(0xff367495),
  Color(0xff4C7863),
  Color(0xff12918B),
  Color(0xffAF6D40),
];

class MessageList extends StatelessWidget {
  final _conversations = List.generate(
    20,
    (index) => Conversation(
          id: index,
          from: _names[index % 10],
          color: _backgroundColors[index % 10],
          latestMessage:
              'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus, et. Obcaecati, neque nostrum natus amet vero odit nihil hic labore tempora sapiente unde quo aliquam facilis at minima reprehenderit atque.',
        ),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(height: 1.0);
      },
      itemCount: _conversations.length,
      itemBuilder: (BuildContext context, int index) {
        final _conversation = _conversations[index];
        final String _name = _conversation.from;
        final String _initials =
            _name.split(' ').map((string) => string[0]).join();

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MessageScreen(conversation: _conversation);
                },
              ),
            );
          },
          child: Container(
            key: ValueKey(_conversation.id),
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 48.0,
                  width: 48.0,
                  child: CircleAvatar(
                    backgroundColor: _conversation.color,
                    child: Text(
                      _initials,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: MioColors.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _conversation.from,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        _conversation.latestMessage,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: MioColors.secondary.withOpacity(0.6),
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
