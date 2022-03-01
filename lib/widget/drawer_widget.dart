import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardMenu extends StatelessWidget {
  const DashBoardMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width:  180,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/clip.png"),
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              leading: Icons.dashboard_outlined,
              press: () => Navigator.pop(context),
            ),
            DrawerListTile(
              title: "Table List",
              leading: Icons.chair_outlined,
              press: () => Navigator.pushNamed(context, '/table'),
            ),
            DrawerListTile(
              title: 'Logout',
              leading: Icons.logout,
              press: () => _logOut(context),
            ),
          ],
        ),
      ),
    );
  }

  _logOut(BuildContext context) async => showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text("Yes"),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('token');
                prefs.clear();
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text("No"),
              onPressed: () => Navigator.pop(ctx),
            ),
          ],
        ),
      );
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.leading,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData leading;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        trailing: Icon(
          leading,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      );
}
