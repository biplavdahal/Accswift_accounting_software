import 'package:accswift/models/general_summary_model.dart';

abstract class StatsService {
  Future<List<GeneralSummary>> getGeneralSummary();
}
