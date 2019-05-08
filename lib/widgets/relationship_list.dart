import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/widgets/relationship.dart';

class RelationshipList extends StatelessWidget {
  const RelationshipList({
    Key key,
    this.relationships,
    this.id,
  }) : super(key: key);
  final List<String> relationships;
  final String id;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.transparent, Colors.black],
        ).createShader(Rect.fromLTWH(0, 0, 16, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [Colors.transparent, Colors.black],
          ).createShader(Rect.fromLTWH(rect.width - 16, 0, 16, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: SizedBox(
          height: 32.0,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            separatorBuilder: (context, index) {
              return SizedBox(width: 8.0);
            },
            scrollDirection: Axis.horizontal,
            itemCount: relationships.length,
            itemBuilder: (context, index) {
              var _relationship = relationships[index];
              return Relationship(key: ValueKey(_relationship), type: _relationship);
            },
          ),
        ),
      ),
    );
    // return SizedBox(
    //   height: 32.0,
    //   child: ListView.separated(
    //     padding: EdgeInsets.symmetric(horizontal: 16.0),
    //     separatorBuilder: (context, index) {
    //       return SizedBox(width: 8.0);
    //     },
    //     scrollDirection: Axis.horizontal,
    //     itemCount: relationships.length,
    //     itemBuilder: (context, index) {
    //       var _relationship = relationships[index];
    //       return Relationship(
    //           key: ValueKey(_relationship), type: _relationship);
    //     },
    //   ),
    // );
  }
}
