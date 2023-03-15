import 'package:accswift/core/base/base_service.dart';
import 'package:accswift/dtos/fetch_current_user_dto.dart';
import 'package:accswift/models/user_model.dart';
import 'package:accswift/services/user_service.dart';
import 'package:dio/dio.dart';

class UserServiceImpl extends BaseService<UserServiceImpl>
    implements UserService {
  User? _currentUser;
  @override
  User? get currentUser => _currentUser;
  @override
  set currentUser(User? user) {
    _currentUser = user;
  }

  @override
  Future<void> fetchCurrentUser() async {
    try {
      final _response = await apiService.get(FetchCurrentUserDTO().endpoint);
      _currentUser = User.fromJson(_response.data['Entity']);
    } on DioError {
      rethrow;
    }
  }
}
