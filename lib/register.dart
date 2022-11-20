import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/db.dart';
import 'package:untitled/main.dart';

class Pages extends StatefulWidget {
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
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  bool saving = false;
  TextEditingController userAccount = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  // TextEditingController userMail = TextEditingController();

  int accoutsuccess=0;
  int passwordsuccess=0;
  // int mailsuccess=0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("註冊畫面"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // Container(
            //   padding:EdgeInsets.only(left: 50,right: 50),
            //   child:TextField(
            //       controller: userMail,
            //       decoration: InputDecoration(
            //           icon: Icon(Icons.mail_outline_outlined),
            //           labelText:'輸入信箱'
            //       )
            //   ),),
            Container(
              padding:EdgeInsets.only(left: 50,right: 50),
              child:TextField(
                  controller: userAccount,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person_outline_outlined),
                      labelText:'輸入名稱'
                  )
              ),),
            Container(
              padding:EdgeInsets.only(left: 50,right: 50),
              child:TextField(
                  controller: userPassword,
                  decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key_outlined),
                      labelText:'輸入密碼'
                  )
              ),),

            Padding(
              padding: const EdgeInsets.all(60.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10.0),
                  primary: Colors.grey,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () async{


                  AppDB.db.getAccount(userAccount.text)?.then((value) async{

                    if( value.length >0) {print("寫入密碼1");
                    accoutsuccess =0;

                    for(var i=0;i<value.length;i++){
                      print(value[i].toString());
                    }

                    showAlertDialog(context, "重複帳號");
                    }

                    print("這是編輯結果分隔線");
                    print("這是編輯新增分隔線");
                    if(value.length ==0) {
                      print("寫入帳號2");
                      print  (accoutsuccess = await AppDB.db.insertAccount(userAccount.text,userPassword.text));
                    }
                    print("這是新增結果分隔線");

                  });





                  bool register = await accountSetting(userAccount.text, userPassword.text);
                  Future.delayed(Duration(milliseconds:500), () async {

                    {
                      if (register)
                        Navigator.pushNamed(context, '/main');
                      else {
                        showAlertDialog(context, "register fail");
                      }
                    }

                  });

                },
                child: const Text('註冊',
                  style: TextStyle(color:Colors.white),
                ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    checkColor: Colors.yellow,

                    value: saving,
                    onChanged: (bool? value) {
                      setState(() {


                        saving = value!;
                      });
                    }

                ),
                Text("我已閱讀並同意"),
                TextButton(
                  onPressed: (){
                    showPrivacyDialog(context);},
                  child: Text("隱私權政策"),
                ),
                Text('及'),
                TextButton(
                  onPressed: (){
                    showTermsDialog(context);
                  },
                  child: Text("服務條款"),
                ),


              ],
            )

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  showPrivacyDialog(BuildContext context) {
    // Init
    AlertDialog dialog = AlertDialog(
      insetPadding: EdgeInsets.only(bottom: 600),
      title: Text("隱私權政策"),

    );

    // Show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        }
    );
  }

  showTermsDialog(BuildContext context) {
    // Init
    AlertDialog dialog = AlertDialog(
      insetPadding: EdgeInsets.only(bottom: 600),
      title: Text("服務條款"),

    );

    // Show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        }
    );
  }

  Future<bool> accountSetting(String account ,String password  )async{





    int hold3sec = 0;
    while(hold3sec<3 && accoutsuccess==0 ){



      print ("accoutsuccess:"+accoutsuccess.toString());
      print ("passwordsuccess:"+passwordsuccess.toString());
      // print ("mailsuccess:"+mailsuccess.toString());
      print ("早?"+(accoutsuccess>0 && passwordsuccess>0 ).toString());

      sleep(Duration(seconds:1));
      hold3sec++;
    }
    return( accoutsuccess>0 );




  }
}
//為了儲存帳號功能