import 'package:flutter/material.dart';
import 'package:gatherlens/app/routes/app_routes.dart';
import 'package:gatherlens/app/views/dashboard.dart';
import 'package:gatherlens/app/views/photo_room_view.dart';
import 'package:gatherlens/app/views/signin_screen.dart';
import 'package:gatherlens/app/views/signup_screen.dart';

class AppPages {
  static const initial = AppRoutes.dashboard;

  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
          settings: settings,
        );
      case AppRoutes.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
          settings: settings,
        );
      case AppRoutes.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
          settings: settings,
        );
      case AppRoutes.photoRoom:
        return MaterialPageRoute(
          builder: (_) => const PhotoRoomView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const Center(
                  child: Text('error'),
                ));
    }
  }
}
