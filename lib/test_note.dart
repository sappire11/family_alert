import 'package:flutter/material.dart';
class Testnote extends StatefulWidget {
  const Testnote({Key? key}) : super(key: key);

  @override
  State<Testnote> createState() => _TestnoteState();
}

class _TestnoteState extends State<Testnote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                  child: Column(
                    children: [
                      Text("123123123"),
                      Text("456456"),
                    ],
                  )),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Container(
                    color: Colors.red,
                    width:  MediaQuery.of(context).size.width/2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("789789789"),
                            ],
                          ),
                        ],
                      )),
                ),
                Center(
                  child: Container(
                      color: Colors.blue,
                      width:  MediaQuery.of(context).size.width/2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("789789789"),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
