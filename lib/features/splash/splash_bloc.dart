import 'dart:async';

import 'package:buy_and_sell/features/home/home_screen.dart';
import 'package:flutter/cupertino.dart';

class SplashBloc{


  BuildContext context;
  //common variable


  SplashBloc (this.context);
  //constructure


  void goToHome(){
    var screen = HomeScreen();
    var route = CupertinoPageRoute(builder: (_) => screen);
    Navigator.of(context).push(route);
  }

  void waitToGoHome(){
   Timer(Duration(seconds: 1), (){
     goToHome();
   });
  }


}