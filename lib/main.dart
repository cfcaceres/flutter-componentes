import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home.page.dart';
import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      // home: HomePage());
      initialRoute: '/',
      routes: getAplicationRouter(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
