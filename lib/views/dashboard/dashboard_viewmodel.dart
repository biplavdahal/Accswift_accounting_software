import 'package:accswift/core/base/base_viewmodel.dart';

class DashboardViewModel extends BaseViewModel {
  // Data
  int _screenIndex = 0;
  int get screenIndex => _screenIndex;
  set screenIndex(int index) {
    _screenIndex = index;
    state = free;
  }
}
