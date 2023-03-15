import 'package:flutter/material.dart';
import 'package:accswift/models/ledger_account_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';

class LedgerItem extends StatelessWidget {
  final LedgerAccountModel ledger;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  LedgerItem({
    Key? key,
    required this.ledger,
    this.onDelete,
    this.onEdit,
  }) : super(key: key);

  final Map<String, Color> _statusColor = {
    'DRAFT': Colors.yellow.shade300,
    'UNPAID': Colors.red.shade300,
    'PAID': Colors.green.shade300,
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
            // color: _statusColor[ledger.codeName] ?? Colors.grey.shade300,
            ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          children: [
            SlidableAction(
              onPressed: (context) {
                Fluttertoast.showToast(
                    msg: 'The page is only for view purpose.');
              },
              foregroundColor: Theme.of(context).primaryColor,
              icon: Ionicons.pencil,
              label: 'Edit',
            ),
          ],
          motion: const ScrollMotion(),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Ionicons.bookmark,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        ledger.codeName,
                        style: Theme.of(context).textTheme.overline?.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Ionicons.people,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        ledger.ledgerBalance,
                        style: Theme.of(context).textTheme.overline?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ledger.ledgerBalance,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Ledger Balance',
                        style: TextStyle(
                          color: Color(0xFF838383),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ledger.groupId.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        'Ledger ID',
                        style: TextStyle(
                          color: Color(0xFF838383),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ledger.ledgerCode,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Dr.Cr',
                        style: TextStyle(
                          color: Color(0xFF838383),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
