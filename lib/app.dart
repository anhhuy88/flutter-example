import 'package:app_flutter_provider/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        locale: Locale('en'),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (_) => HomePage(title: 'Trang chủ'),
          '/login': (_) => LoginPage(Provider.of<UserService>(_))
        },
        onUnknownRoute: (RouteSettings settings) {
          return new MaterialPageRoute(
              builder: (context) =>
                  LoginPage(Provider.of<UserService>(context)));
        });
  }
}
