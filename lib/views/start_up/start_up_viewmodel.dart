import 'package:accswift/core/base/base_viewmodel.dart';
import 'package:accswift/core/locator.dart';
import 'package:accswift/core/logger.dart';
import 'package:accswift/helpers/api_error_helpers.dart';
import 'package:accswift/services/authentication_service.dart';
import 'package:accswift/services/user_service.dart';
import 'package:accswift/views/dashboard/dashboard_view.dart';
import 'package:accswift/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StartUpViewModel extends BaseViewModel
    with CustomLogger<StartUpViewModel> {
  // Services
  final _authenticationService = locator<AuthenticationService>();
  final _userService = locator<UserService>();

  Future<void> init() async {
    try {
      final _isLoggedIn = await _authenticationService.isUserLoggedIn();

      if (_isLoggedIn) {
        await _userService.fetchCurrentUser();
        Fluttertoast.showToast(
          msg: 'Welcome back ${_userService.currentUser?.name}',
          textColor: Colors.amber,
        );
        gotoAndClear(DashboardView.tag);
      } else {
        gotoAndClear(LoginView.tag);
      }
    } catch (e) {
      showError(e);
      gotoAndClear(LoginView.tag);
    }
  }
}
