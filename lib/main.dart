import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_catalog/pages/home_page.dart';
import 'package:shopping_catalog/pages/login_page.dart';
import 'package:shopping_catalog/utils/myroutes.dart';
import 'package:shopping_catalog/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Mytheme.lightTheme(context),
      themeMode: ThemeMode.light,
      darkTheme: Mytheme.darkTheme(context),
      initialRoute: Myroutes.homeRoutes,
      routes: {
        "/": (context) => LoginPage(),
        Myroutes.homeRoutes: (context) => HomePage(),
        Myroutes.loginRoutes: (context) => LoginPage(),
      },
    );
  }
}
