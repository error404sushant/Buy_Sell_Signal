import 'package:buy_and_sell/features/home/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/splash': (context) => HomeScreen()
      },
      initialRoute: '/splash',
    );
  }
}
