import 'package:accswift/dtos/delete_ledger_dto.dart';
import 'package:accswift/dtos/fetch_ledger_dto.dart';
import 'package:accswift/models/ledger_account_model.dart';

abstract class LedgerService {
  ///Getter for all ledger list [LedgerAccountModel]
  List<LedgerAccountModel> get ledger;

  ///Set ledger List [LedgerAccountModel]
  set ledger(List<LedgerAccountModel> value);

  ///Getter for boolean value to indicate if there is more data
  bool get hasMoreData;

  /// Fetch all ledger list
  Future<List<LedgerAccountModel>> fetchLedger(FetchLedgerDTO dto);

  ///Delete ledger
  Future<void> deleteLedger(DeleteLedgerDTO dto);
}
