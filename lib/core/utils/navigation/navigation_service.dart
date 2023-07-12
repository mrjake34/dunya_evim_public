import 'package:dunya_evim/core/constants/routers/routers.dart';
import 'package:dunya_evim/core/utils/navigation/navigation_service_interface.dart';
import 'package:flutter/material.dart';

final class NavigationService implements NavigationServiceInterface {
  NavigationService._init();
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  bool Function(Route<dynamic> route) removeAllRoutes = (Route<dynamic> route) => false;

  @override
  void navigateToBack() {
    navigatorKey.currentState!.pop();
  }

  
  void navigateToFirst() {
    NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.home);
  }

  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageAndRemoveUntil({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path, removeAllRoutes, arguments: data);
  }
}
