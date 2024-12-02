import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService();
});

class NavigationService {
  GlobalKey<ScaffoldMessengerState> scafflodMessangerKey =
      GlobalKey<ScaffoldMessengerState>();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  dynamic pushTo({
    dynamic arguments,
    Widget? page,
    String? route,
  }) {
    if (route != null) {
      navigatorKey.currentState
          ?.pushReplacementNamed(route, arguments: arguments);
    } else if (page != null) {
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );
    } else {
      throw ArgumentError('Either routeName or page must be provided.');
    }
  }

  dynamic pop() {
    navigatorKey.currentState?.pop();
  }
}
