import 'package:accswift/dtos/add_journal_dto.dart';
import 'package:accswift/dtos/delete_journal_dto.dart';
import 'package:accswift/dtos/fetch_journal_master_dto.dart';
import 'package:accswift/models/journal_model.dart';

abstract class JournalService {
  ///Getter for all journal list  [JournalModel]
  List<JournalModel> get journal;

  ///Set journal list [JournalModel]
  set journal(List<JournalModel> value);

  /// Getter for boolean value to indicate if there is more data to be loaded
  bool get hasMoreData;

  ///Fetch all journal list
  Future<List<JournalModel>> fetchJournalmaster(FetchJournalMasterDTO dto);

  ///Delete journal invoice
  Future<void> deleteJournal(DeleteJournalDTO dto);

  //Add all journal list
  Future<void> addJournal(AddJournalDTO dto);
}
