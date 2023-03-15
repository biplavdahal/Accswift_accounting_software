import 'dart:convert';

import 'package:accswift/core/base/base_service.dart';
import 'package:accswift/core/locator.dart';
import 'package:accswift/dtos/login_dto.dart';
import 'package:accswift/models/auth_token_model.dart';
import 'package:accswift/services/authentication_service.dart';
import 'package:accswift/services/shared_preference_service.dart';
import 'package:dio/dio.dart';

class AuthenticationServiceImpl extends BaseService<AuthenticationServiceImpl>
    implements AuthenticationService {
  final _prefs = locator<SharedPreferenceService>();

  AuthToken? _authToken;
  @override
  AuthToken? get authToken => _authToken;

  @override
  Future<bool> login(LoginDTO dto) async {
    try {
      final _response = await apiService.post(
        dto.endpoint,
        body: dto.make(),
      );

      if (_response.statusCode == 200) {
        _authToken = AuthToken.fromJson(_response.data);
        apiService.setHeaders(
          'Authorization',
          'Bearer ${_authToken?.accessToken}',
        );
        return true;
      }

      return false;
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<void> saveTokenLocally() async {
    await _prefs.set<String>('_userToken', jsonEncode(_authToken?.toJson()));
  }

  @override
  Future<bool> isUserLoggedIn() async {
    if (_authToken != null) {
      return true;
    }

    final _userToken = await _prefs.get<String?>('_userToken');
    if (_userToken.value != null) {
      _authToken = AuthToken.fromJson(jsonDecode(_userToken.value!));
      apiService.setHeaders(
        'Authorization',
        'Bearer ${_authToken?.accessToken}',
      );
      return true;
    }

    return false;
  }

  @override
  Future<void> clearLocalToken() async {
    await _prefs.remove('_userToken');
  }
}
