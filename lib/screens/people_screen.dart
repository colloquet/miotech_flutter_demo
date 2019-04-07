import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/colors.dart';
import 'dart:math' as math;

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class PeopleScreen extends StatelessWidget {
  PeopleScreen(this.people);
  final people;

  @override
  Widget build(BuildContext context) {
    final _workExperience = people['workExperiences'];
    return Scaffold(
      appBar: AppBar(
        title: Text(people['name']),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    people['name'],
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    people['bio'],
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 48.0,
              maxHeight: 48.0,
              child: Container(
                color: MioColors.base,
                child: Material(
                  elevation: 4.0,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Work Experiences',
                        style: TextStyle(color: MioColors.secondary)),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final _exp = _workExperience[index];
                final _isCurrent =
                    _exp['currentProFlag'] || _exp['currentBoardFlag'];
                final _titleColor =
                    _isCurrent ? MioColors.brand : MioColors.primary;
                final _subTitleColor =
                    _isCurrent ? MioColors.primary : MioColors.secondary;
                final _borderColor =
                    _isCurrent ? MioColors.brand : MioColors.secondary;
                final _isLast = (index + 1) == _workExperience.length;
                final _paddingBottom = _isLast ? 16.0 : 0.0;
                return Padding(
                  padding: EdgeInsets.only(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: _paddingBottom),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: _borderColor)),
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.1, 0.9],
                        colors: _isCurrent
                            ? [
                                MioColors.brand.withOpacity(0.2),
                                MioColors.brand.withOpacity(0.2),
                              ]
                            : [
                                MioColors.fifth,
                                MioColors.fourth,
                              ],
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(_exp['company'],
                            style: TextStyle(color: _titleColor)),
                        SizedBox(height: 4.0),
                        Text(
                          _exp['functionName'],
                          style:
                              TextStyle(color: _subTitleColor, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: _workExperience.length,
            ),
          ),
        ],
      ),
    );
  }
}
