import 'package:accswift/core/base/base_service.dart';
import 'package:accswift/dtos/add_sales_dto.dart';
import 'package:accswift/dtos/delete_sales_invoice_dto.dart';
import 'package:accswift/models/sales_model.dart';
import 'package:accswift/dtos/fetch_sales_invoice_master_dto.dart';
import 'package:accswift/services/sales_service.dart';
import 'package:dio/dio.dart';

class SalesServiceImplementation extends BaseService<SalesServiceImplementation>
    implements SalesService {
  bool _hasMoreData = false;
  @override
  bool get hasMoreData => _hasMoreData;

  List<SalesModel> _sales = [];
  @override
  List<SalesModel> get sales => _sales;
  @override
  set sales(List<SalesModel> value) {
    _sales = value;
  }

  @override
  Future<List<SalesModel>> fetchSalesInvoiceMaster(
      FetchSalesInvoiceMasterDTO dto) async {
    try {
      final _response = await apiService.post(
        dto.endpoint,
        body: dto.make(),
      );

      if (_response.statusCode == 200) {
        if (dto.pageNumber < _response.data['Entity']['TotalPages']) {
          _hasMoreData = true;
        } else {
          _hasMoreData = false;
        }

        final _data = _response.data['Entity']['Entity'] as List;

        return _data.map((e) => SalesModel.fromJson(e)).toList();
      }

      return [];
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<void> deleteSalesInvoice(DeleteSalesInvoiceDTO dto) async {
    try {
      final _delete = await apiService.delete('${dto.endpoint}/${dto.id}');

      if (_delete) {
        _sales.removeWhere((e) => e.id == dto.id);
      }
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<void> addSales(AddSalesDTO dto) async {
    // info(dto.make());

    try {
      final _response = await apiService.post(dto.endpoint, body: dto.make());

      if (_response.statusCode == 201) {
        final _newSale = SalesModel.fromJson(_response.data);
        _sales.insert(0, _newSale);
      }
    } on DioError {
      rethrow;
    }
  }
}
