import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/colors.dart';
import 'package:miotech_flutter_demo/screens/security_screen.dart';

class SecurityItem extends StatelessWidget {
  SecurityItem({
    Key key,
    @required this.security,
  }) : super(key: key);
  final security;

  @override
  Widget build(BuildContext context) {
    final _currentPrice = security['currenctPrice']['adjustedPrice'];
    final _changeFromPreviousClose = security['equityAsset']
        ['equityTradingQuote']['changeFromPreviousClose'];
    final _percentChangeFromPreviousClose = security['equityAsset']
        ['equityTradingQuote']['percentChangeFromPreviousClose'];
    final _displayPercentageChange =
        (_percentChangeFromPreviousClose * 100).toStringAsFixed(2).toString();
    final _isPositive = _changeFromPreviousClose >= 0;
    final _textColor = _isPositive ? MioColors.green : MioColors.orange;

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SecurityScreen(security)));
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
                    security['assetIDGroup']['name'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    security['assetIDGroup']['ticker'],
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
                    Text(security['currency']),
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
