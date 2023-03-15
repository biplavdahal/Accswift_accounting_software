import 'package:accswift/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';

class BillReminder extends StatelessWidget {
  const BillReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.brown.shade100,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color(0xFFf4f590),
      child: Container(
        padding: UIPadding.medium,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'No More Late Fees!',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  UISpace.spaceVrSm,
                  const Text('You have 3 bills due by 20 Dec.'),
                  UISpace.spaceVrSm,
                  Row(
                    children: [
                      const Text(
                        'Rs.10,999',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      UISpace.spaceHrSm,
                      Flexible(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const FittedBox(child: Text('View Bills')),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            UISpace.spaceHrSm,
            Container(
              padding: UIPadding.medium,
              decoration: BoxDecoration(
                color: const Color(0xFF8be78b),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '20\nDays Left!',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
