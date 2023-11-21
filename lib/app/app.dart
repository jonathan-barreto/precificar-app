import 'package:flutter/material.dart';
import 'package:precificar_app/app/core/theme/theme_data_custom.dart';
import 'package:precificar_app/app/presenter/initial/page/initial_page.dart';
import 'package:precificar_app/app/presenter/login/page/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeDataCustom,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/initial': (context) => const InitialPage(),
      },
    );
  }
}
