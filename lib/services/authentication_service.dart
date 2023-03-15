import 'package:accswift/dtos/login_dto.dart';
import 'package:accswift/models/auth_token_model.dart';

abstract class AuthenticationService {
  /// The [AuthToken] instance.
  AuthToken? get authToken;

  /// Login user with username and password.
  /// Successfull login will store the token in the [AuthToken] instance.
  /// Returns [true] if login was successful.
  Future<bool> login(LoginDTO dto);

  /// Save access token of user locally.
  Future<void> saveTokenLocally();

  /// Check if user is logged in.
  Future<bool> isUserLoggedIn();

  /// Logout user
  Future<void> clearLocalToken();
}
