import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/setting.dart';

class Account extends StatefulWidget {
  //MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool saving = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  Center(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [

            ListTile(
              leading: Icon(Icons.group_add_outlined),
              title: Text('個人檔案'),

              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('帳戶設定'),

              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.control_point_outlined),
              title: Text('幫助與支援'),

              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text('登出'),

              onTap: () {

                context.read<Setting>().logout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);

              },
            ),
          ],
        ),
      ),

    );
  }
}