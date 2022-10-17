import 'package:flutter/material.dart';

class servingpages extends StatefulWidget {
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
  _servingpagesState createState() => _servingpagesState();
}

class _servingpagesState extends State<servingpages > {
  bool saving = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("服務中心"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Row(
          children: [
            Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  padding:EdgeInsets.only(left: 50,right: 50),
                  child:TextField(
                      decoration: InputDecoration(
                          labelText:'輸入名稱'
                      )
                  ),),
                Container(
                  padding:EdgeInsets.only(left: 50,right: 50),
                  child:TextField(
                      decoration: InputDecoration(
                          labelText:'輸入郵件'
                      )
                  ),),


                const Image(
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
                Container(
                  padding:EdgeInsets.only(left: 50,right: 50),
                  child:TextField(
                      decoration: InputDecoration(
                          labelText:'內容'
                      )
                  ),
                ),





              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }




}