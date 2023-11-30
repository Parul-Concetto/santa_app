import 'package:flutter/material.dart';
import 'package:santa_app/core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Poppins'),
      //home: HomePage(),
    );
  }
}
