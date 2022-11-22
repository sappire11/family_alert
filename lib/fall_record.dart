import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/setting.dart';
import 'package:untitled/webview.dart';

class Fall extends StatefulWidget {
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
  _FallState createState() => _FallState();
}

class _FallState extends State<Fall> {
  bool saving = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  Center(
        child: ListView(

          padding: EdgeInsets.all(40),
          children: [
                // Text("現在甚麼都沒有",style: TextStyle(fontSize: 30),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                // leading: Icon(Icons.group_add_outlined),
                title: Text('跌倒事件'),
                subtitle: Text("時間"+"2022-11-13 16:26:25"),

                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          WebViewExample(url: "http://163.17.136.146:10007/stream/filename/?filename=20221113_162625")));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                // leading: Icon(Icons.group_add_outlined),
                title: Text('跌倒事件'),
                subtitle: Text("時間"+"2022/11/13 16:28:21"),

                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          WebViewExample(url: "http://163.17.136.146:10007/stream/filename/?filename=20221113_162821")));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                // leading: Icon(Icons.group_add_outlined),
                title: Text('跌倒事件'),
                subtitle: Text("時間"+"2022/11/13 16:29:49"),

                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          WebViewExample(url: "http://163.17.136.146:10007/stream/filename/?filename=20221113_162949")));
                },
              ),
            ),

          ],
        ),
      ),

    );
  }
}