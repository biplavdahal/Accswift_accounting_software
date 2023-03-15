import 'package:accswift/core/base/base_viewmodel.dart';
import 'package:accswift/core/locator.dart';
import 'package:accswift/core/logger.dart';
import 'package:accswift/dtos/delete_journal_dto.dart';
import 'package:accswift/dtos/fetch_journal_master_dto.dart';
import 'package:accswift/helpers/api_error_helpers.dart';
import 'package:accswift/services/journal_service.dart';
import 'package:accswift/models/journal_model.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JournalViewModel extends BaseViewModel
    with CustomLogger<JournalViewModel> {
  // Service
  final _journalService = locator<JournalService>();

  // Data
  List<JournalModel> get journal => _journalService.journal;


  int _currentPage = 1;

  // Actions
  Future<void> init() async {
    state = busy;

    try {
      final _journal = await _journalService.fetchJournalmaster(
        FetchJournalMasterDTO(_currentPage, 'row', 10),
      );
      _journalService.journal = _journal;
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

  Future<void> loadMore() async {
    if (_journalService.hasMoreData) {
      setWidgetBusy('load-more');

      _currentPage = _currentPage + 1;

      try {
        final _journal = await _journalService.fetchJournalmaster(
          FetchJournalMasterDTO(_currentPage, 'row', 10),
        );
        _journalService.journal = [..._journalService.journal, ..._journal];
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

  Future<void> delete(JournalModel invoice) async {
    setWidgetBusy('delete-${invoice.id}');

    try {
      await _journalService.deleteJournal(
        DeleteJournalDTO(invoice.id),
      );

      Fluttertoast.showToast(
        msg: 'Invoice ${invoice.id} deleted.',
        toastLength: Toast.LENGTH_LONG,
      );
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

    unsetWidgetBusy('delete-${invoice.id}');
  }
}
