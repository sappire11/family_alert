import 'package:flutter/material.dart';
import 'package:untitled/models/control_model.dart';

class ControlProvider extends ChangeNotifier {
    ControlPanel _controlPanel = ControlPanel(
         bathroomLight : false,
         livingRoomLight : false,
         bedRoomLight : false,
         livingRoomCurtain : false,
         airConditioner : false,

    );
    ControlPanel get controlPanel => _controlPanel;


    void bathroomLightSwitch(){
        _controlPanel.bathroomLight = !_controlPanel.bathroomLight;
        notifyListeners();
    }
    void livingRoomLightSwitch(){
        _controlPanel.livingRoomLight = !_controlPanel.livingRoomLight;
        notifyListeners();
    }
    void bedRoomLightSwitch(){
        _controlPanel.bedRoomLight = !_controlPanel.bedRoomLight;
        notifyListeners();
    }
    void livingRoomCurtainSwitch(){
        _controlPanel.livingRoomCurtain = !_controlPanel.livingRoomCurtain;
        notifyListeners();
    }
    void airConditionerSwitch(){
        _controlPanel.airConditioner = !_controlPanel.airConditioner;
        notifyListeners();
    }


}