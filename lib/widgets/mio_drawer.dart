import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';
import 'package:miotech_flutter_demo/ami_icons.dart';

class MioDrawer extends StatelessWidget {
  const MioDrawer({this.currentTab, this.onChange});
  final String currentTab;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
              top: 24.0 + MediaQuery.of(context).padding.top,
            ),
            color: MioColors.fifth,
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 64.0,
                  width: 64.0,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xff12918b),
                    child: Text(
                      'MT',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: MioColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('MioTech', style: TextStyle(fontSize: 16.0)),
                    Text(
                      'info@miotech.com',
                      style: TextStyle(color: MioColors.secondary),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <DrawerItem>[
                DrawerItem(
                  isActive: currentTab == 'ami',
                  tabKey: 'ami',
                  title: 'AMI',
                  icon: AmiIcons.ami_logo,
                  onTap: onChange,
                ),
                DrawerItem(
                  isActive: currentTab == 'messages',
                  tabKey: 'messages',
                  title: 'Messages',
                  icon: Icons.chat_bubble,
                  onTap: onChange,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    this.isActive,
    this.tabKey,
    this.title,
    this.onTap,
    this.icon,
  });
  final bool isActive;
  final String tabKey;
  final String title;
  final Function onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final Color _primaryColor = Theme.of(context).brightness == Brightness.dark ? MioColors.primary : Colors.black;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24.0),
      title: Text(
        title,
        style: TextStyle(
            color: isActive ? _primaryColor : MioColors.secondary),
      ),
      leading:
          Icon(icon, color: isActive ? _primaryColor : MioColors.secondary),
      onTap: () {
        onTap(tabKey);
        Navigator.pop(context);
      },
    );
  }
}
