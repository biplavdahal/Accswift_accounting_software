import 'package:flutter/material.dart';
import 'package:accswift/models/sales_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ionicons/ionicons.dart';

class SaleItem extends StatelessWidget {
  final SalesModel sale;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  SaleItem({
    Key? key,
    required this.sale,
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
          color: _statusColor[sale.status] ?? Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Slidable(  
        startActionPane: ActionPane(
          children: [
            SlidableAction(
              onPressed: (context) {
                onDelete?.call();
              },
              foregroundColor: Colors.red,
              icon: Ionicons.trash,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) {
                onEdit?.call();
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
                        sale.voucherNo,
                        style: Theme.of(context).textTheme.overline?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
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
                        sale.cashPartName,
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
                        sale.specialDiscount.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Special Discount',
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
                        sale.netAmount.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Net Amount',
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
                        sale.totalAmount.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Total Amount',
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
