import 'package:accswift/core/base/base_viewmodel.dart';
import 'package:accswift/core/locator.dart';
import 'package:accswift/core/logger.dart';
import 'package:accswift/dtos/delete_sales_invoice_dto.dart';
import 'package:accswift/dtos/fetch_sales_invoice_master_dto.dart';
import 'package:accswift/helpers/api_error_helpers.dart';
import 'package:accswift/services/sales_service.dart';
import 'package:accswift/models/sales_model.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SalesViewModel extends BaseViewModel with CustomLogger<SalesViewModel> {
  // Service
  final _salesService = locator<SalesService>();

  // Data
  List<SalesModel> get sales => _salesService.sales;
  int _currentPage = 1;

  // Actions
  Future<void> init() async {
    state = busy;

    try {
      final _sales = await _salesService.fetchSalesInvoiceMaster(
        FetchSalesInvoiceMasterDTO(_currentPage, 'row', 10),
      );
      _salesService.sales = _sales;
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
    if (_salesService.hasMoreData) {
      setWidgetBusy('load-more');

      _currentPage = _currentPage + 1;

      try {
        final _sales = await _salesService.fetchSalesInvoiceMaster(
          FetchSalesInvoiceMasterDTO(_currentPage, 'row', 10),
        );
        _salesService.sales = [..._salesService.sales, ..._sales];
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

  Future<void> delete(SalesModel invoice) async {
    setWidgetBusy('delete-${invoice.id}');

    try {
      await _salesService.deleteSalesInvoice(
        DeleteSalesInvoiceDTO(invoice.id),
      );

      Fluttertoast.showToast(
        msg: 'Invoice ${invoice.voucherNo} deleted.',
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
