import 'package:accswift/core/base/base_viewmodel.dart';
import 'package:accswift/core/locator.dart';
import 'package:accswift/core/logger.dart';
import 'package:accswift/dtos/login_dto.dart';
import 'package:accswift/helpers/api_error_helpers.dart';
import 'package:accswift/services/authentication_service.dart';
import 'package:accswift/services/user_service.dart';
import 'package:accswift/views/dashboard/dashboard_view.dart';
import 'package:accswift/views/reset_password/reset_password_view.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginViewModel extends BaseViewModel with CustomLogger<LoginViewModel> {
  // Services
  final _authenticationService = locator<AuthenticationService>();
  final _userService = locator<UserService>();

  // Data
  String? username;
  String? password;

  Future<void> onLoginPressed() async {
    state = busy;
    try {
      final _login = await _authenticationService.login(
        LoginDTO(username!, password!),
      );

      if (_login) {
        await _userService.fetchCurrentUser();
        await _authenticationService.saveTokenLocally();

        gotoAndClear(DashboardView.tag);
      }
    } catch (e) {
      if (e is DioError) {
        showApiError(e);
      } else {
        Fluttertoast.showToast(
          msg: 'Something unexpected occured.',
          toastLength: Toast.LENGTH_LONG,
        );
      }
    }
    state = free;
  }

  void onForgotPasswordPressed() {
    goto(ResetPasswordView.tag);
  }
}
