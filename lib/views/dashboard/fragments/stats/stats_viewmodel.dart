import 'package:accswift/core/base/base_viewmodel.dart';
import 'package:accswift/core/locator.dart';
import 'package:accswift/core/logger.dart';
import 'package:accswift/helpers/api_error_helpers.dart';
import 'package:accswift/models/general_summary_model.dart';
import 'package:accswift/services/stats_service.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StatsViewModel extends BaseViewModel with CustomLogger {
  final _statsService = locator<StatsService>();

  List<GeneralSummary> _generalSummaries = [];
  List<GeneralSummary> get generalSummaries => _generalSummaries;

  Future<void> init() async {
    try {
      state = busy;
      _generalSummaries = await _statsService.getGeneralSummary();
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
}
