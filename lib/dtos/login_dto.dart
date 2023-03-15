class LoginDTO {
  String get endpoint => 'User/Login';

  final String _username;
  final String _password;

  LoginDTO(this._username, this._password);

  Map<String, dynamic> make() {
    return {
      'UserName': _username,
      'Password': _password,
    };
  }

  @override
  String toString() {
    return 'LoginDTO{_username: $_username, _password: $_password}';
  }
}
