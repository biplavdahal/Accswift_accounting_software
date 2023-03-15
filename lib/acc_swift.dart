import 'package:accswift/core/locator.dart';
import 'package:accswift/routes.dart';
import 'package:accswift/services/navigator_service.dart';
import 'package:accswift/views/start_up/start_up_view.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AccSwift extends StatelessWidget {
  const AccSwift({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AccSwift™',
      theme: FlexThemeData.light(scheme: FlexScheme.bahamaBlue).copyWith(
        appBarTheme: FlexThemeData.light(scheme: FlexScheme.bahamaBlue)
            .appBarTheme
            .copyWith(
              centerTitle: true,
            ),
      ),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.bahamaBlue).copyWith(
        appBarTheme: FlexThemeData.dark(scheme: FlexScheme.bahamaBlue)
            .appBarTheme
            .copyWith(
              centerTitle: true,
            ),
      ),
      themeMode: ThemeMode.system,
      navigatorKey: locator<NavigatorService>().navigationKey,
      onGenerateRoute: (settings) => locator<NavigatorService>().generateRoute(
        settings,
        routesAndViews(settings),
      ),
      home: const StartUpView(),
    );
  }
}
