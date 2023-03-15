import 'package:accswift/core/base/base_viewmodel.dart';
import 'package:accswift/core/locator.dart';
import 'package:accswift/services/authentication_service.dart';
import 'package:accswift/services/user_service.dart';
import 'package:accswift/views/login/login_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MoreViewModel extends BaseViewModel {
  Future<void> onLogoutPressed() async {
    await locator<AuthenticationService>().clearLocalToken();
    Fluttertoast.showToast(
        msg: 'Logged out',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM);
    locator<UserService>().currentUser = null;
    gotoAndClear(LoginView.tag);
  }
}
