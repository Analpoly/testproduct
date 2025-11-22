import 'package:flutter_application_1/screens/post_detailscreen.dart';
import 'package:get/get.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

appRoutes() => [
      GetPage(name: '/login', page: () => LoginScreen()),
      GetPage(name: '/home', page: () => HomeScreen()),
      GetPage(name: '/postDetails', page: () => PostDetailsScreen()),
    ];
