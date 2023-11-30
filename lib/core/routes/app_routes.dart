import 'package:flutter/material.dart';
import 'package:santa_app/presentation/pages/add_data.dart';
import 'package:santa_app/presentation/pages/list_page.dart';

class AppRoutes {
  static String initial = '/';
  static String add = '/add_info';
  static Map<String, Widget Function(BuildContext)> routes = {
    initial: (context) => const HomePage(),
    add: (context) => const OpenDialog(),
  };
}
