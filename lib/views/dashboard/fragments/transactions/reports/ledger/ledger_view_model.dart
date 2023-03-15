import 'package:accswift/core/locator.dart';
import 'package:accswift/core/logger.dart';
import 'package:accswift/helpers/api_error_helpers.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:accswift/models/ledger_account_model.dart';
import 'package:accswift/services/ledger_service.dart';
import 'package:accswift/dtos/fetch_ledger_dto.dart';
import 'package:accswift/dtos/delete_ledger_dto.dart';
import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/core/base/base_viewmodel.dart';

class LedgerViewModel extends BaseViewModel with CustomLogger<LedgerViewModel> {
  // Service
  final _ledgerService = locator<LedgerService>();

  // Data
  List<LedgerAccountModel> get ledger => _ledgerService.ledger;
  int _currentPage = 1;

  // Actions
  Future<void> init() async {
    state = busy;

    try {
      final _ledger = await _ledgerService.fetchLedger(
        FetchLedgerDTO(_currentPage, 'row', 10),
      );
      _ledgerService.ledger = _ledger;
    } catch (e) {
      if (e is DioError) {
        showApiError(e);
      } else {
        Fluttertoast.showToast(
          msg: 'Something unexpected occured.',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }

    state = free;
  }

  Future<void> loadMore() async {
    if (_ledgerService.hasMoreData) {
      setWidgetBusy('load-more');

      _currentPage = _currentPage + 1;

      try {
        final _ledger = await _ledgerService.fetchLedger(
          FetchLedgerDTO(_currentPage, 'row', 10),
        );
        _ledgerService.ledger = [..._ledgerService.ledger, ..._ledger];
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

      unsetWidgetBusy('load-more');
    }
  }
}
