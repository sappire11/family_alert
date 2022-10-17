import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:untitled/acconnt_function.dart';
import 'package:untitled/fall.dart';
import 'package:untitled/provider/setting.dart';
import 'package:untitled/viedo.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/webview.dart';
import 'home_page.dart';
import 'models/data.dart';

class FunctionA extends StatefulWidget {
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
  _FunctionAState createState() => _FunctionAState();
}

class _FunctionAState extends State<FunctionA> {
  bool saving = false;


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {

     // callAPI();
      // setting.updateUser();
    });
    Setting setting = Provider.of<Setting>(context);
    return Scaffold(

      body: Center(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(" 你好 ! !  "+Provider.of<Setting>(context, listen: false).username,style: TextStyle(fontSize: 20),),
            ),

            FutureBuilder(
                future: _getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    try {
                      final Map<String, dynamic> jsonData = json.decode(
                          snapshot.data.toString());
                      data info = data.fromJson(jsonData);

                      return  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height/3,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text( (info.fallState == 1)?"跌倒了":"沒有跌倒"  ),
                                  ),


                                  if(info.fallState == 1)Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('跌倒時間' + info.fallTime.toString()),
                                  ),
                                  if(info.fallState == 1)Divider(thickness: 5,),
                                  if(info.fallState == 1)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextButton(onPressed: (){
                                        //寫死的影片位置
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) =>
                                                WebViewExample(url: "https://forum.gamer.com.tw/C.php?bsn=34880&snA=12188&tnum=15&subbsn=2")));
                                        //真正用api替換影片網址的function
                                        // getVideoUrl(info.fallTime);
                                        // Navigator.of(context).push(MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         Video(time: info.fallTime.toString())));
                                      }, child: Text("確認影片")),
                                    ),
                                ],
                              )),
                          Divider(thickness: 5,endIndent: 0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(

                                    width:  MediaQuery.of(context).size.width/3,
                                    child: Column(
                                      children: [


                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('一氧化碳狀態' + ((info.carbonState ==0)?"正常":"不正常")),
                                        ),



                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('一氧化碳時間' + info.carbonTime.toString()),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('一氧化碳數值' + info.carbonValue.toString()),
                                        ),


                                      ],
                                    )),
                              ),

                               Container(
                                 height: MediaQuery.of(context).size.height/3,
                                 child: VerticalDivider(

                                      width: 50,
                              thickness: 5,
                                 indent: 0,
                                 endIndent: 5,
                                 color: Colors.grey,
                             ),
                               ),
                              Center(
                                child: Container(

                                    width:  MediaQuery.of(context).size.width/3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('煙霧數值' + ((info.smokeState==0)?"正常":"不正常")),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('煙霧時間' + info.smokeValue.toString()),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('煙霧狀態' + info.smokeValue.toString()),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ],
                      );
                      //   Column(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Text( (info.fallState == 1)?"跌倒了":"沒有跌倒"  ),
                      //     ),
                      //
                      //     Divider(thickness: 5,),
                      //     if(info.fallState == 1)Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Text('跌倒時間' + info.fallTime.toString()),
                      //     ),
                      //     if(info.fallState == 1)Divider(thickness: 5,),
                      //     if(info.fallState == 1)
                      //       Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: TextButton(onPressed: (){
                      //           getVideoUrl(info.fallTime);
                      //           // Navigator.of(context).push(MaterialPageRoute(
                      //           //     builder: (context) =>
                      //           //         Video(time: info.fallTime.toString())));
                      //           }, child: Text("確認影片")),
                      //       ),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Text('煙霧數值' + info.smokeState.toString()),
                      //     ),
                      //     Divider(thickness: 5,),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Text('煙霧時間' + info.smokeValue.toString()),
                      //     ),
                      //     Divider(thickness: 5,),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Text('煙霧狀態' + info.smokeValue.toString()),
                      //     ),
                      //     Divider(thickness: 5,),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Text('一氧化碳狀態' + info.carbonState.toString()),
                      //     ),
                      //     Divider(thickness: 5,),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Text('一氧化碳時間' + info.carbonTime.toString()),
                      //     ),
                      //     Divider(thickness: 5,),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Text('一氧化碳數值' + info.carbonValue.toString()),
                      //     ),
                      //     Divider(thickness: 5,),
                      //
                      //   ],
                      // );
                    } catch (e) {
                      return Center(child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("發生錯誤"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(snapshot.data.toString(),style: TextStyle(color:Colors.red,fontSize: 20),),
                            ),
                          ],
                        ),
                      ));
                    }
                  }
                  else return Center(child: CircularProgressIndicator());
                }),


          ],
        ),
      )

    );

  }
  Future _getData() {
    return createData();
    return Future.delayed(Duration(seconds: 2), () {});
  }

  Future<String> createData() {

    return _createData(
      Uri.parse('http://163.17.136.146:10009/get_state'),
    );
  }

  Future<String> _createData(
    
    
      Uri url,
      // data body,
      ) async {
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        // body: body.toJson(),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return response.body.toString();
      } else {
        return response.statusCode.toString();
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
  }


  Future getVideoUrl(time) async {
    

    String date = time;
    //remove ":" && "-";
    String date2 = date.replaceAll(":", "");
    date2 = date2.replaceAll("-", "");
    //replace " " to "_";
    date2 = date2.replaceAll(" ", "_");
    String url = "http://163.17.136.146:10007/stream/filename/?filename="+date2;

    print("這是影片網址");
    print(url);
      Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                WebViewExample(url: url)));


  //   try{
  //   final response = await http.get(
  //       Uri.parse("http://163.17.136.146:10009/get_fall_video?video_time="+time),

  //   );
  //   if(response.statusCode == 200 ){
  //     print(response.request);
  //     print(response.body);
  //     final Map<String, dynamic> jsonData = json.decode(
  //         response.body);
  //     print("這是影片網址");
  //   print(jsonData["fall_video_url"]);
  //     Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) =>
  //               WebViewExample(url: jsonData["fall_video_url"])));
  //   }else{
  //     print(response.body);
  //     print("錯誤代碼"+response.statusCode.toString());

  //   }

  // }catch(e){
  //     print(e.toString());
  //   }
    }




  Future<void> callAPI() async {


    var formData = FormData.fromMap({


    });

    var url = "https://www.qiketo.com/ajax/app/update/user";

    print(url);

    try{
      //   Response response = await Dio().post(url, data: formData);
      //
      // var responseBody = response.data;
      // var x = json.decode(responseBody);
      // print(json.decode(responseBody));
      // if (Provider.of<Setting>(context, listen: false).debug) {
      //   Fluttertoast.showToast(
      //       msg: x['errorMassage'],
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.BOTTOM,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Colors.blueGrey,
      //       textColor: Colors.white,
      //       fontSize: 16.0
      //   );
      // }
      // // context.read<SettingModel>().updateUser();
      // if(x['errorMassage']>6) {
      //   await NotificationService().showNotification(
      //     1!,
      //     "KetoAir",
      //     "A new event has been created.",
      //     jsonEncode({
      //       "title": "KetoAir",
      //       "eventDate": DateFormat("EEEE, d MMM y").format(
      //           DateTime.now()).toString(),
      //       "eventTime": TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute)
      //           .toString(),
      //     }),
      //   );
      // }
    }
    catch(e){
      if (Provider.of<Setting>(context, listen: false).debug){
        Fluttertoast.showToast(
            msg: "update weight : "+ e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }

    }






    Navigator.pushNamedAndRemoveUntil(context, "/center", (route) => false);

  }
}