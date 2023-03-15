import 'package:accswift/core/locator.dart';
import 'package:accswift/core/logger.dart';
import 'package:accswift/services/api_service.dart';

abstract class BaseService<T> with CustomLogger<T> {
  ApiService apiService = locator<ApiService>();
}
