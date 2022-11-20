
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/provider/contral_panel_provider.dart';
import 'package:untitled/register.dart';
import 'package:untitled/information.dart';
import 'package:untitled/db.dart';
import 'package:untitled/provider/setting.dart';
import 'package:untitled/viedo.dart';
import 'package:untitled/setting.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'notificationservice.dart';

class MyHttpOverrides extends HttpOverrides{
  //給予網路通行憑證，如果沒加的話會沒辦法連接指定伺服器
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Setting>(
          create: (context) => new Setting(),
        ),
        ChangeNotifierProvider<ControlProvider>(
          create: (context) => new ControlProvider(),
        ),

      ],
      child: MaterialApp(
        initialRoute: '/',

        routes: {
          '/main': (context) => MyHomePage(title: '首頁'),
          "/Pages": (context) => Pages(),
          "/functionA": (context) => FunctionA(),
          "/viedo": (context) => Video(time: "2022-08-04 20:20:30",),
          "/account": (context) => Account(),
          "/homepage": (context) => Homepage(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.grey[900],
            elevation: 10,
            selectedLabelStyle: TextStyle(
                color: Color(0xFFA67926), fontFamily: 'Montserrat', fontSize: 14.0
            ),
            unselectedLabelStyle: TextStyle(
                color: Colors.grey[600], fontFamily: 'Montserrat', fontSize: 12.0
            ),
            selectedItemColor: Color(0xFFA67926),
            unselectedItemColor: Colors.grey[600],
            showUnselectedLabels: true,
          ),
        ),
        darkTheme: ThemeData.dark(),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController userAccount = TextEditingController();
  TextEditingController userPassword = TextEditingController();

String dbAccount="";
String dbPassword ="";
 void initState() {
    // 要先做父類的State狀態初始化
    super.initState();
    //再做自己的事，如取得資料
 Future.delayed(Duration(milliseconds:500), () async {
    
       

        AppDB.db.getAccount("account")?.then((valueA) {

          if( valueA.length >0) {

            dbAccount = valueA[0].values.first;
            dbPassword= valueA[0].values.first;
           print(dbAccount+dbPassword);

          }
        });


      setState(() {

      });


      });

  //      Future.delayed(Duration(seconds: 1), () async {




  //         if(lodingProcess) {
  //         if (_acMain.text != "" && _pwMain.text != "")
  //           loginInMain(_acMain.text, _pwMain.text, remember);
  //         else
  //           setState(() {
  //             waitLogin = false;
  //             lodingProcess = false;
  //           });
  //         }
  //       });
   }

   bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
     Setting setting = Provider.of<Setting>(context);
    return Scaffold(

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '智慧家庭',
              style: TextStyle(fontSize: 30),
            ),
            Container(
              padding:EdgeInsets.only(left: 50,right: 50),
              child:TextField(
                controller: userAccount,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText:'帳號'
                  ),

              ),),
            Container(
              padding:EdgeInsets.only(left: 50,right: 50),
              child:TextField(
                  controller: userPassword,
                  obscureText:hidePassword,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Center the text',
                      suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            hidePassword=!hidePassword;
                            setState(() {

                            });
                          }
                      ),
                      labelText:'密碼'
                  )
              ),),
            Align(   alignment: Alignment.topRight,
              child:Padding(
                padding: const EdgeInsets.only(right: 50),

              ),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                primary: Colors.grey,
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () async{
                waitAlertDialog(context);
              await AppDB.db.login(userAccount.text,userPassword.text)?.then((value) {
                if (value.length > 0) {

                  setting.updateUseraccount(value.first['useraccount']);
                  Navigator.pushNamed(context, "/homepage");
                }
                else {
                  Navigator.pop(context);
                  showAlertDialog(context, "error");
                }
                });


              },
              child: const Text('登入',
                style: TextStyle(color:Colors.white),
              ),),

            Container(
              width: 50,
              child: Row(
                children: [
                  Divider(
                    height: 50,
                    thickness: 20,
                    color: Colors.white,
                  ),
                  Text(
                      '或'
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                primary: Colors.grey,
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () {
                print(123);
                Navigator.pushNamed(context, '/Pages');
              },
              child: const Text('註冊',
                style: TextStyle(color:Colors.white),
              ),),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

} //為了儲存帳號功能

showAlertDialog(BuildContext context, String error) {
  // Init
  AlertDialog dialog = AlertDialog(

    insetPadding: EdgeInsets.only(),
    title: Text(error),

  );

  // Show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      }
  );
}
waitAlertDialog(BuildContext context) {
  // Init

  // Show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      }
  );
}
