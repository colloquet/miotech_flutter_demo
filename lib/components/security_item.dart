import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/screens/security_screen.dart';

class SecurityItem extends StatefulWidget {
  SecurityItem({
    Key key,
    @required this.security,
  }) : super(key: key);
  final security;

  @override
  _SecurityItemState createState() => _SecurityItemState();
}

class _SecurityItemState extends State<SecurityItem> {
  double _currentPrice;
  double _changeFromPreviousClose;
  double _percentChangeFromPreviousClose;
  String _displayPercentageChange;
  bool _isPositive;
  Color _textColor;

  @override
  void initState() {
    super.initState();
    _currentPrice = widget.security['currenctPrice']['adjustedPrice'].toDouble();
    _changeFromPreviousClose = widget.security['equityAsset']
        ['equityTradingQuote']['changeFromPreviousClose'].toDouble();
    _percentChangeFromPreviousClose = widget.security['equityAsset']
        ['equityTradingQuote']['percentChangeFromPreviousClose'].toDouble();
    _displayPercentageChange =
        (_percentChangeFromPreviousClose * 100).toStringAsFixed(2).toString();
    _isPositive = _changeFromPreviousClose >= 0;
    _textColor = _isPositive ? MioColors.green : MioColors.orange;
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SecurityScreen(widget.security)));
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    widget.security['assetIDGroup']['name'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    widget.security['assetIDGroup']['ticker'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: MioColors.secondary),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(widget.security['currency']),
                    SizedBox(width: 4.0),
                    Text(
                      _currentPrice.toString(),
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      _isPositive ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      size: 16.0,
                      color: _textColor,
                    ),
                    Text(
                      _changeFromPreviousClose.toStringAsFixed(2).toString(),
                      style: TextStyle(color: _textColor),
                    ),
                    Text(
                      '($_displayPercentageChange%)',
                      style: TextStyle(color: _textColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
