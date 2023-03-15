import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/services/navigator_service.dart';
import 'package:flutter/material.dart';

class NavigatorServiceImpl implements NavigatorService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  @override
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  @override
  Future navigateTo(String routeName, {arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future navigateToAndClearStack(String routeName, {arguments}) {
    return _navigationKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  @override
  Future navigateToAndPop(String routeName, {arguments}) {
    return _navigationKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }

  @override
  void pop({result}) {
    _navigationKey.currentState!.pop(result);
  }

  @override
  bool get canGoBack => _navigationKey.currentState!.canPop();

  @override
  Route<dynamic> generateRoute<T extends BaseView>(
      RouteSettings settings, Map<String, Widget> views) {
    return _getPageRoute(
      routeName: settings.name!,
      viewToShow: views[settings.name]!,
    );
  }

  PageRoute _getPageRoute(
      {required String routeName, required Widget viewToShow}) {
    return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow,
    );
  }
}
