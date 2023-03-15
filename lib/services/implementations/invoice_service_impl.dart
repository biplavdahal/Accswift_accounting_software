import 'package:accswift/core/base/base_service.dart';
import 'package:accswift/dtos/get_all_cash_parties_dto.dart';
import 'package:accswift/dtos/get_all_depot_dto.dart';
import 'package:accswift/dtos/get_all_ledger_accounts_dto.dart';
import 'package:accswift/dtos/get_all_products_dto.dart';
import 'package:accswift/dtos/get_all_projects_dto.dart';
import 'package:accswift/dtos/get_all_series_dto.dart';
import 'package:accswift/dtos/get_all_taxes_dto.dart';
import 'package:accswift/dtos/get_series_voucher_dto.dart';
import 'package:accswift/models/depot_location_model.dart';
import 'package:accswift/models/product_model.dart';
import 'package:accswift/models/ledger_account_model.dart';
import 'package:accswift/models/cash_party_model.dart';
import 'package:accswift/models/series_model.dart';
import 'package:accswift/models/project_model.dart';
import 'package:accswift/models/series_voucher_model.dart';
import 'package:accswift/models/tax_model.dart';
import 'package:accswift/services/invoice_service.dart';
import 'package:dio/dio.dart';

class InvoiceServiceImpl extends BaseService<InvoiceServiceImpl>
    implements InvoiceService {
  @override
  Future<List<CashPartyModel>> getAllCashParties() async {
    try {
      final _response = await apiService.get(GetAllCashPartiesDTO().endpoint);

      if (_response.statusCode == 200) {
        final _data = _response.data['Entity'] as List;

        return _data.map((e) => CashPartyModel.fromJson(e)).toList();
      }

      return [];
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<List<LedgerAccountModel>> getAllLedgerAccounts(
      GetAllLedgerAccountsDTO dto) async {
    try {
      final _response = await apiService.get(dto.endpoint);

      if (_response.statusCode == 200) {
        final _data = _response.data['Entity'] as List;

        return _data.map((e) => LedgerAccountModel.fromJson(e)).toList();
      }

      return [];
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final _response = await apiService.get(GetAllProductsDTO().endpoint);

      if (_response.statusCode == 200) {
        final _data = _response.data['Entity'] as List;

        return _data.map((e) => ProductModel.fromJson(e)).toList();
      }

      return [];
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<List<TaxModel>> getAllTaxes() async {
    try {
      final _response = await apiService.get(GetAllTaxesDTO().endpoint);

      if (_response.statusCode == 200) {
        final _data = _response.data['Entity'] as List;

        return _data.map((e) => TaxModel.fromJson(e)).toList();
      }

      return [];
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<List<DepotLocationModel>> getAllDepot() async {
    try {
      final _response = await apiService.get(GetAllDepotDTO().endpoint);

      if (_response.statusCode == 200) {
        final _data = _response.data['Entity'] as List;

        return _data.map((e) => DepotLocationModel.fromJson(e)).toList();
      }

      return [];
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<List<ProjectModel>> getAllProjects() async {
    try {
      final _response = await apiService.get(GetAllProjectsDTO().endpoint);

      if (_response.statusCode == 200) {
        final _data = _response.data['Entity'] as List;

        return _data.map((e) => ProjectModel.fromJson(e)).toList();
      }

      return [];
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<List<SeriesModel>> getAllSeries(GetAllSeriesDTO dto) async {
    try {
      final _response = await apiService.get(dto.endpoint, params: dto.make());

      if (_response.statusCode == 200) {
        final _data = _response.data['Entity'] as List;

        return _data.map((e) => SeriesModel.fromJson(e)).toList();
      }

      return [];
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<SeriesVoucherModel> getSeriesVoucher(GetSeriesVoucherDTO dto) async {
    try {
      final _response = await apiService.get(dto.endpoint, params: dto.make());

      return SeriesVoucherModel.fromJson(_response.data);
    } on DioError {
      rethrow;
    }
  }
}
