import 'package:flutter/material.dart';
import 'package:haoyako/features/authentication/presentation/pages/auth_screen.dart';
import 'package:haoyako/features/home/presentation/pages/home_screen.dart';
import 'package:haoyako/features/profile/presentation/pages/profile_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String profile = '/profile';
  static const String nearby = '/nearby';
  static const String bookmark = '/bookmark';
  static const String notification = '/notification';
  static const String message = '/message';
  static const String setting = '/setting';
  static const String help = '/help';
  static const String auth = '/auth';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => HomeScreen(),
      profile: (context) => const ProfileScreen(),
      auth: (context) => const AuthScreen(),
      // nearby: (context) => const NearbyScreen(),
      // bookmark: (context) => const BookmarkScreen(),
      // notification: (context) => const NotificationScreen(),
      // message: (context) => const MessageScreen(),
      // setting: (context) => const SettingScreen(),
      // help: (context) => const HelpScreen(),
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      // case nearby:
      //   return MaterialPageRoute(builder: (_) => const NearbyScreen());
      // case bookmark:
      //   return MaterialPageRoute(builder: (_) => const BookmarkScreen());
      // case notification:
      //   return MaterialPageRoute(builder: (_) => const NotificationScreen());
      // case message:
      //   return MaterialPageRoute(builder: (_) => const MessageScreen());
      // case setting:
      //   return MaterialPageRoute(builder: (_) => const SettingScreen());
      // case help:
      //   return MaterialPageRoute(builder: (_) => const HelpScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
