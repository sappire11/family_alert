import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/contral_panel_provider.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {

  bool bathroomLight = false;
  bool livingRoomLight = false;
  bool bedRoomLight = false;
  bool livingRoomCurtain = false;
  bool airConditioner = false;
  late ControlProvider switchController = Provider.of<ControlProvider>(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  //臥室電燈
                   Expanded(
                      child: InkWell(
                        onTap: (){
                          switchController.bedRoomLightSwitch();
                        },
                        child:Container(
                          height: MediaQuery.of(context).size.height *0.2,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color:(switchController.controlPanel.bedRoomLight)?Colors.yellow:Colors.grey,
                            border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Center(
                              child: Text(
                                "臥室電燈"+((switchController.controlPanel.bedRoomLight)?"關":"開"),
                                style: TextStyle(color:(switchController.controlPanel.bedRoomLight)?Colors.black:Colors.white) ,
                          )),
                        )
                      ),
                  ),
                  //客廳電燈
                  Expanded(
                    child: InkWell(
                        onTap: (){
                          switchController.livingRoomLightSwitch();
                        },
                        child:Container(
                          height: MediaQuery.of(context).size.height *0.2,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color:(switchController.controlPanel.livingRoomLight)?Colors.yellow:Colors.grey,
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Center(
                                child: Text(
                                    "客廳電燈"+((switchController.controlPanel.livingRoomLight)?"關":"開"),
                                      style: TextStyle(color:(switchController.controlPanel.livingRoomLight)?Colors.black:Colors.white)
                                      )),


                        )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  //廁所電燈
                  Expanded(
                    child: InkWell(
                        onTap: (){
                          switchController.bathroomLightSwitch();
                        },
                        child:Container(
                          height: MediaQuery.of(context).size.height *0.2,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color:(switchController.controlPanel.bathroomLight)?Colors.yellow:Colors.grey,
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Center(child: Text("客廳窗簾"+((switchController.controlPanel.bathroomLight)?"關":"開"),
                              style: TextStyle(color:(switchController.controlPanel.bathroomLight)?Colors.black:Colors.white))),
                        )
                    ),
                  ),
                  //客廳窗簾
                  Expanded(
                    child: InkWell(
                        onTap: (){
                          switchController.livingRoomCurtainSwitch();
                        },
                        child:Container(
                          height: MediaQuery.of(context).size.height *0.2,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color:(switchController.controlPanel.livingRoomCurtain)?Colors.yellow:Colors.grey,
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Center(child: Text("臥室窗簾"+((switchController.controlPanel.livingRoomCurtain)?"關":"開"),
                                style: TextStyle(color:(switchController.controlPanel.livingRoomCurtain)?Colors.black:Colors.white))),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  //冷氣開關
                  Expanded(
                    child: InkWell(
                        onTap: (){
                          switchController.airConditionerSwitch();
                        },
                        child:Container(
                          height: MediaQuery.of(context).size.height *0.2,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color:(switchController.controlPanel.airConditioner)?Colors.yellow:Colors.grey,
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Center(child: Text("冷氣"+((switchController.controlPanel.airConditioner)?"關":"開"),
                              style: TextStyle(color:(switchController.controlPanel.airConditioner)?Colors.black:Colors.white))),
                        )
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
