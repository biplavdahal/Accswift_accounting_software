import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/views/purchase/purchase_viewmodel.dart';
import 'package:accswift/views/purchase/widgets/purchase_item.dart';
import 'package:accswift/views/write_invoice/write_invoice_arguments.dart';
import 'package:accswift/views/write_invoice/write_invoice_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PurchaseView extends StatelessWidget {
  static String tag = 'purchase-view';

  const PurchaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PurchaseViewModel>(
      killViewOnClose: false,
      onModelReady: (model) => model.init(),
      builder: (ctx, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Purchase'),
            actions: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () async {
                  await model.goto(
                    WriteInvoiceView.tag,
                    arguments: WriteInvoiceArguments(InvoiceType.purchase),
                  );
                  model.state = model.free;
                },
                icon: const Icon(Ionicons.add),
                label: const Text('Invoice'),
              ),
            ],
          ),
          body: model.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Color(0xFFf4f590),
                ))
              : Stack(children: [
                  ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      final _purchase = model.purchases[index];

                      return AnimatedOpacity(
                        opacity: model.isBusyWidget('delete-${_purchase.id}')
                            ? 0.4
                            : 1,
                        duration: const Duration(milliseconds: 300),
                        child: PurchaseItem(
                          _purchase,
                          onDelete: () async {
                            await model.delete(_purchase);
                          },
                          onEdit: () async {
                            await model.goto(
                              WriteInvoiceView.tag,
                              arguments: WriteInvoiceArguments(
                                InvoiceType.purchase,
                                invoice: _purchase,
                              ),
                            );
                            model.state = model.free;
                          },
                        ),
                      );
                    },
                    itemCount: model.purchases.length,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedContainer(
                      padding: EdgeInsets.all(
                          model.isBusyWidget('load-more') ? 16 : 0),
                      color: Colors.white,
                      duration: const Duration(milliseconds: 100),
                      child: model.isBusyWidget('load-more')
                          ? const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Color(0xFFf4f590),
                              ),
                            )
                          : Container(),
                    ),
                  )
                ]),
        );
      },
    );
  }
}
