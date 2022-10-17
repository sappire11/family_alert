import 'package:flutter/material.dart';
import 'package:untitled/models/user_model.dart';

class Setting extends ChangeNotifier{

    String _account="";
    bool _debug=false;
   User provider=User(
       account:"",
       // email:"",
       password:""
   );



    String get username =>_account;
    bool get  debug =>_debug;
    void updateUseraccount(String username){
      _account=username;
      notifyListeners();
    }
    logout(){
      _account="";
      notifyListeners();
    }
    }
