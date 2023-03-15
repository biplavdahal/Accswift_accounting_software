import 'package:accswift/models/user_model.dart';

abstract class UserService {
  /// Returns the current user instance [User] if logged in.
  User? get currentUser;

  /// Set the current user instance [User]
  set currentUser(User? user);

  /// Fetches the user instance [User] from the server.
  Future<void> fetchCurrentUser();
}
