import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/root.dart';
import 'store/store.dart';
import 'screens/consts.dart';

void main() {
  runApp(
    Provider<Store>(
      create: (context) => Store(),
      dispose: (context, value) => value.dispose(),
      child: TheApp(), 
    )
  );
}

class TheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title of app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootScreen(),
      initialRoute: '/',
      routes: { //some example screen that might be used
        '/home': (context) => RootScreen(tab: SCREEN_HOME),
        '/settings': (context) => RootScreen(tab: SCREEN_SETTINGS),
      },
    );
  }
}