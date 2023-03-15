import 'package:accswift/core/base/base_viewmodel.dart';
import 'package:accswift/core/locator.dart';
import 'package:accswift/core/logger.dart';
import 'package:accswift/dtos/delete_purchase_invoice_dto.dart';
import 'package:accswift/helpers/api_error_helpers.dart';
import 'package:accswift/services/purchase_service.dart';
import 'package:accswift/models/purchase_model.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PurchaseViewModel extends BaseViewModel
    with CustomLogger<PurchaseViewModel> {
  // Service
  final _purchaseService = locator<PurchaseService>();

  // Data
  List<PurchaseModel> get purchases => _purchaseService.purchases;

  // Actions
  Future<void> init() async {
    state = busy;

    try {
      final _purchases = await _purchaseService.fetchPurchaseInvoiceMaster();
      _purchaseService.purchases = _purchases;
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

  Future<void> delete(PurchaseModel invoice) async {
    setWidgetBusy('delete-${invoice.id}');

    try {
      await _purchaseService.deletePurchaseInvoice(
        DeletePurchaseInvoiceDTO(invoice.id),
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
