import 'package:accswift/core/base/base_service.dart';
import 'package:accswift/dtos/add_journal_dto.dart';
import 'package:accswift/dtos/delete_journal_dto.dart';
import 'package:accswift/dtos/fetch_journal_master_dto.dart';
import 'package:accswift/services/journal_service.dart';
import 'package:accswift/models/journal_model.dart';
import 'package:dio/dio.dart';

class JournalServiceImplementation
    extends BaseService<JournalServiceImplementation>
    implements JournalService {
  @override
  bool hasMoreData = false;
  bool get hasMoredata => hasMoreData;

  List<JournalModel> _journal = [];
  @override
  List<JournalModel> get journal => _journal;

  @override
  set journal(List<JournalModel> value) {
    _journal = value;
  }

  @override
  Future<void> deleteJournal(DeleteJournalDTO dto) async {
    try {
      final _delete = await apiService.delete('${dto.endpoint}/${dto.id}');

      if (_delete) {
        _journal.removeWhere((e) => e.id == dto.id);
      }
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<void> addJournal(AddJournalDTO dto) async {
    try {
      final _response = await apiService.post(dto.endpoint, body: dto.make());

      if (_response.statusCode == 200) {
        final _newJournal = JournalModel.fromJson(_response.data);
        _journal.insert(0, _newJournal);
      }
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<List<JournalModel>> fetchJournalmaster(
      FetchJournalMasterDTO dto) async {
    try {
      final _response = await apiService.post(dto.endpoint, body: dto.make());

      if (_response.statusCode == 200) {
        if (dto.pageNumber < _response.data['Entity']['Totalpages']) {
          hasMoreData = true;
        } else {
          hasMoreData = false;
        }
        final _data = _response.data['Entity']['Entity'] as List;
        return _data.map((e) => JournalModel.fromJson(e)).toList();
      }
      return [];
    } on DioError {
      rethrow;
    }
  }

}
