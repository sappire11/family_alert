import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/RSTP.dart';
import 'package:untitled/provider/setting.dart';
import 'package:untitled/test_note.dart';
import 'package:untitled/viedo.dart';
import 'package:untitled/webview.dart';

import 'setting.dart';
import 'fall_record.dart';
import 'information.dart';

class Homepage extends StatefulWidget {
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
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool saving = false;
  int _currentIndex = 0; //預設值
  // final pages = [FunctionA() , Fall(), Account()];
  final pages = [FunctionA() , Fall(),VideoRSTP()];
  // final title = ["主頁", "跌倒紀錄", "帳號設定"];
  final title = ["主頁", "跌倒紀錄","即時影像"];
  void _onItemClick(int index) {

    setState(() {
      print(index);

      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(title[_currentIndex])),
      body:  pages[_currentIndex],
        bottomNavigationBar:

        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Flexible(
                flex: 1,
                child: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: '首頁',
                    ),

                    BottomNavigationBarItem(
                      icon: Icon(Icons.elderly),
                      label: '跌倒紀錄',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.videocam),
                      label: '即時影像',
                    ),

                    // BottomNavigationBarItem(
                    //   icon: Icon(Icons.settings),
                    //   label: '設定',
                    // ),


                  ],
                  currentIndex: _currentIndex,
                  selectedItemColor: Colors.amber[800],
                  onTap: _onItemClick,
                ),
              ),
              Flexible(
                  flex: 1,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        ),

                          onPressed: ()=>{
                            if(mounted) {
                              logout()
                            }
                      }, child:
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Icon(Icons.logout_outlined),
                               Text("登出")
                             ],
                           )),
                   ),
            ],
          ),
        ));



  }
  logout(){

      context.read<Setting>().logout();
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);

  }
}
