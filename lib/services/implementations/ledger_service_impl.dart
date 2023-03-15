import 'package:accswift/core/base/base_service.dart';
import 'package:accswift/dtos/delete_ledger_dto.dart';
import 'package:accswift/dtos/fetch_ledger_dto.dart';
import 'package:accswift/services/ledger_service.dart';
import 'package:accswift/models/ledger_account_model.dart';
import 'package:dio/dio.dart';

class LedgerServiceImplementation
    extends BaseService<LedgerServiceImplementation> implements LedgerService {
  bool _hasMoreData = false;
  @override
  bool get hasMoreData => _hasMoreData;

  List<LedgerAccountModel> _ledger = [];
  @override
  List<LedgerAccountModel> get ledger => _ledger;
  @override
  set ledger(List<LedgerAccountModel> value) {
    _ledger = value;
  }

  @override
  Future<List<LedgerAccountModel>> fetchLedger(FetchLedgerDTO dto) async {
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

        return _data.map((e) => LedgerAccountModel.fromJson(e)).toList();
      }

      return [];
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<void> deleteLedger(DeleteLedgerDTO dto) async {
    try {
      final _delete = await apiService.delete('${dto.endpoint}/${dto.id}');

      if (_delete) {
        _ledger.removeWhere((e) => e.groupId == dto.id);
      }
    } on DioError {
      rethrow;
    }
  }
}
