import 'package:accswift/core/base/base_service.dart';
import 'package:accswift/dtos/general_summary_dto.dart';
import 'package:accswift/models/general_summary_model.dart';
import 'package:accswift/services/stats_service.dart';
import 'package:dio/dio.dart';

class StatsServiceImpl extends BaseService<StatsServiceImpl>
    implements StatsService {
  @override
  Future<List<GeneralSummary>> getGeneralSummary() async {
    try {
      final _response = await apiService.get(GeneralSummaryDTO().endpoint);

      if (_response.statusCode == 200) {
        final _data = _response.data['Entity'] as List;

        return _data.map((e) => GeneralSummary.fromJson(e)).toList();
      }

      return [];
    } on DioError {
      rethrow;
    }
  }
}
