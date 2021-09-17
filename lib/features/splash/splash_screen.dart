import 'package:buy_and_sell/features/splash/splash_bloc.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //region declaration
  late SplashBloc splashBloc;
  //endregion

  @override
  void initState() {
    //region object create
    splashBloc = SplashBloc(context);
    //endregion

    splashBloc.waitToGoHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: body(),




    );
  }

  Widget body(){
    return Center(
      child: rotatedText(),
    )
    ;
  }





  Widget rotatedText(){
    return Center(
      child:
        Text("hh")
        // boxWidth: double.infinity,

    );

  }

}
