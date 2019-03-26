import 'package:flutter/material.dart';
import 'MessageScreen.dart';

var names = [
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

var backgroundColors = [
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

class MessageListScreen extends StatelessWidget {
  var conversations = List.generate(
      10,
      (index) => {
            'id': index,
            'from': names[index],
            'color': backgroundColors[index],
            'latestMessage':
                'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus, et. Obcaecati, neque nostrum natus amet vero odit nihil hic labore tempora sapiente unde quo aliquam facilis at minima reprehenderit atque.',
          });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
            height: 1.0,
            color: Color(0xff344056),
          ),
      itemCount: conversations.length,
      itemBuilder: (BuildContext context, int index) {
        var conversation = conversations[index];
        String name = conversation['from'];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MessageScreen(conversation: conversation)),
            );
          },
          child: Container(
            key: ValueKey(conversation['id']),
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 48.0,
                  width: 48.0,
                  child: CircleAvatar(
                    backgroundColor: conversation['color'],
                    child: Text(name.split(' ').map((string) => string[0]).join(),
                        style: TextStyle(fontSize: 20.0)),
                  ),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(conversation['from']),
                      SizedBox(height: 8.0),
                      Text(
                        conversation['latestMessage'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Color(0xff8ca0b3)),
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
