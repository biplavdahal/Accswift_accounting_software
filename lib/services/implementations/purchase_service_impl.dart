import 'package:accswift/core/base/base_service.dart';
import 'package:accswift/dtos/delete_purchase_invoice_dto.dart';
import 'package:accswift/dtos/fetch_purchase_invoice_master_dto.dart';
import 'package:accswift/models/purchase_model.dart';
import 'package:accswift/services/purchase_service.dart';
import 'package:dio/dio.dart';

class PurchaseServiceImpl extends BaseService<PurchaseServiceImpl>
    implements PurchaseService {
  List<PurchaseModel> _purchases = [];
  @override
  List<PurchaseModel> get purchases => _purchases;
  @override
  set purchases(List<PurchaseModel> value) {
    _purchases = value;
  }

  @override
  Future<List<PurchaseModel>> fetchPurchaseInvoiceMaster() async {
    try {
      final _response = await apiService.get(
        FetchPurchaseInvoiceMasterDTO().endpoint,
      );

      if (_response.statusCode == 200) {
        final _data = _response.data['Entity'] as List;

        return _data.map((e) => PurchaseModel.fromJson(e)).toList();
      }

      return [];
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<void> deletePurchaseInvoice(DeletePurchaseInvoiceDTO dto) async {
    try {
      final _delete = await apiService.delete('${dto.endpoint}/${dto.id}');

      if (_delete) {
        _purchases.removeWhere((e) => e.id == dto.id);
      }
    } on DioError {
      rethrow;
    }
  }
}
