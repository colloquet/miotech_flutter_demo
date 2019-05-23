import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/models/people.dart';

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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
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
  const PeopleScreen(this.people);
  final People people;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> _workExperience = people.workExperiences;
    return Scaffold(
      appBar: AppBar(
        title: Text(people.name),
      ),
      body: Scrollbar(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      people.name,
                      style: TextStyle(fontSize: 24.0),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      people.bio,
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
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Work Experiences',
                        style: TextStyle(color: MioColors.secondary),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverSafeArea(
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final dynamic _exp = _workExperience[index];
                    final dynamic _isCurrent =
                        _exp['currentProFlag'] || _exp['currentBoardFlag'];
                    final Color _titleColor =
                        _isCurrent ? MioColors.brand : MioColors.primary;
                    final Color _subTitleColor =
                        _isCurrent ? MioColors.primary : MioColors.secondary;
                    final Color _borderColor =
                        _isCurrent ? MioColors.brand : MioColors.secondary;
                    final bool _isLast = (index + 1) == _workExperience.length;
                    final double _paddingBottom = _isLast ? 16.0 : 0.0;
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
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: const <double>[0.1, 0.9],
                            colors: _isCurrent
                                ? <Color>[
                                    MioColors.brand.withOpacity(0.2),
                                    MioColors.brand.withOpacity(0.2),
                                  ]
                                : <Color>[
                                    MioColors.fifth,
                                    MioColors.fourth,
                                  ],
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 24.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(_exp['company'],
                                style: TextStyle(color: _titleColor)),
                            const SizedBox(height: 4.0),
                            Text(
                              _exp['functionName'],
                              style: TextStyle(
                                  color: _subTitleColor, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: _workExperience.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
