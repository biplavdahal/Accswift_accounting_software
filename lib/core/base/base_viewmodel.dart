import 'package:accswift/core/base/base_view_arguments.dart';
import 'package:accswift/core/locator.dart';
import 'package:accswift/services/navigator_service.dart';
import 'package:flutter/material.dart';

enum VState {
  free,
  busy,
  error,
  warn,
}

class BaseViewModel extends ChangeNotifier {
  final _navigator = locator<NavigatorService>();

  // [States and State manager start]
  VState free = VState.free;
  VState busy = VState.busy;
  VState error = VState.error;
  VState warn = VState.warn;

  final Map<String, bool> _busyWidgetsMap = {};

  String? msg;

  VState _state = VState.free;
  VState get state => _state;
  set state(VState viewState) {
    msg = null;
    _state = viewState;
    notifyListeners();
  }

  // Use [setWidgetBusy(), unsetWidgetBusy()] if you want to only show progress indicator to
  // certain widget.
  void setWidgetBusy(String key) {
    if (_busyWidgetsMap.containsKey(key)) {
      _busyWidgetsMap.update(key, (_) => true);
    } else {
      _busyWidgetsMap.putIfAbsent(key, () => true);
    }
    notifyListeners();
  }

  void unsetWidgetBusy(String key) {
    if (_busyWidgetsMap.containsKey(key)) {
      _busyWidgetsMap.update(key, (_) => false);
    } else {
      _busyWidgetsMap.putIfAbsent(key, () => false);
    }
    notifyListeners();
  }

  /// This getter function will return a boolean value which will
  /// indicate if the model state is loading or not.
  bool get isLoading => _state == busy;

  bool isBusyWidget(String key) => _busyWidgetsMap[key] ?? false;

  // [States and State manager end]

  // [Model disposal/reuse logic start]

  bool onModelReadyCalled = false;

  // [Model disposal/reuse logic end]

  // [Navigation start]

  Future goto(String routeName, {BaseViewArguments? arguments}) async {
    return _navigator.navigateTo(routeName, arguments: arguments);
  }

  Future gotoAndPop(String routeName, {BaseViewArguments? arguments}) async {
    return _navigator.navigateToAndPop(routeName, arguments: arguments);
  }

  Future gotoAndClear(String routeName, {BaseViewArguments? arguments}) async {
    return _navigator.navigateToAndClearStack(routeName, arguments: arguments);
  }

  void goBack({dynamic result}) {
    _navigator.pop(result: result);
  }

  bool get canGoBack => _navigator.canGoBack;

  // [Navigation end]

}
