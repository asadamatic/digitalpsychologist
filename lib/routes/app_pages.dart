import 'package:digitalpsychologist/routes/app_routes.dart';
import 'package:digitalpsychologist/sessions_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static const SESSIONSSCREEN = Routes.SESSIONSSCREEN;
  static const NEWSESSION = Routes.NEWSESSION;

  static final routes = [
    GetPage(
      name: Routes.SESSIONSSCREEN,
      page: () => SessionsScreen(),
    ),
  ];
}