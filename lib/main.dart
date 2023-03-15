import 'package:accswift/acc_swift.dart';
import 'package:accswift/core/locator.dart';
import 'package:accswift/services/api_service.dart';
import 'package:accswift/services/shared_preference_service.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  await locator<SharedPreferenceService>()();
  locator<ApiService>()(baseUrl: 'http://api.accswift.com/');

  runApp(const AccSwift());
}
