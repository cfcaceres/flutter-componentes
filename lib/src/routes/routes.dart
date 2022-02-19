import 'package:componentes/src/pages/card_page.dart';
import 'package:flutter/material.dart';

import '../pages/alert_page.dart';
import '../pages/avatar_page.dart';
import '../pages/home.page.dart';

Map<String, WidgetBuilder> getAplicationRouter() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
  };
}
