class AddJournalDTO {
  String get endpoint => 'JournalMaster';

  final int id = 0;
  final String date;
  final double amount;
  final double drAmount;
  final double crAmount;
  final String remarks;
  final List<Map<String, dynamic>> transactionSubLedger;
  final int projectID;
  final String projectName;
  final String codeName;
  final String ledgerName;
  final String ledgerCode;
  final String ledgerBalance;
  final String voucherNo;
  final String voucherType;
  final List<Map<String, dynamic>> recurringVoucher;

  AddJournalDTO(
      {required this.amount,
      required this.drAmount,
      required this.crAmount,
      required this.remarks,
      required this.transactionSubLedger,
      required this.date,
      required this.projectID,
      required this.projectName,
      required this.codeName,
      required this.ledgerName,
      required this.ledgerCode,
      required this.ledgerBalance,
      required this.voucherNo,
      required this.voucherType,
      required this.recurringVoucher,
    });

  Map<String, dynamic> make() {
    return {
      'ID': id,
      'Date': date,
      'Amount': amount,
      'DrAmount': drAmount,
      'CrAmount': crAmount,
      'Remarks': remarks,
      'TransactionSubLedger': transactionSubLedger,
      'ProjectID': projectID,
      'ProjectName': projectName,
      'CodeName': codeName,
      'LedgerName': ledgerName,
      'LedgerCode': ledgerCode,
      'LegderBalance': ledgerBalance,
      'VoucherNo': voucherNo,
      'VoucherType': voucherType,
      'RecurringVoucher': recurringVoucher,
    };
  }
}
