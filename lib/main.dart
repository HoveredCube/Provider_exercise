import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/homepage.dart';
import 'screens/hellopage.dart';
import 'providers/provider1.dart';

void main() => runApp(ChangeNotifierProvider<UserNameProvider>(
      create: (_) => UserNameProvider(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/hellopage': (context) => const HelloPage(),
      },
    );
  }
}
