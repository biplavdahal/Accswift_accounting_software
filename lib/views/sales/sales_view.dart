import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/views/sales/sales_viewmodel.dart';
import 'package:accswift/views/sales/widgets/sale_item.dart';
import 'package:accswift/views/write_invoice/write_invoice_arguments.dart';
import 'package:accswift/views/write_invoice/write_invoice_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SalesView extends StatelessWidget {
  static String tag = 'sales-view';

  const SalesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return BaseView<SalesViewModel>(
      onDispose: (model) {
        _scrollController.dispose();
      },
      onModelReady: (model) async {
        await model.init();
        _scrollController.addListener(() {
          if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
            model.loadMore();
          }
        });
      },
      initState: (model) {
        _scrollController.addListener(() {
          if (_scrollController.position.maxScrollExtent ==
              _scrollController.offset) {
            model.loadMore();
          }
        });
      },
      killViewOnClose: false,
      builder: (ctx, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sales'),
            actions: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () async {
                  await model.goto(
                    WriteInvoiceView.tag,
                    arguments: WriteInvoiceArguments(InvoiceType.sales),
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
                  ),
                )
              : Stack(
                  children: [
                    ListView.separated(
                      controller: _scrollController,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        final _sale = model.sales[index];

                        return AnimatedOpacity(
                          opacity: model.isBusyWidget('delete-${_sale.id}')
                              ? 0.4
                              : 1,
                          duration: const Duration(milliseconds: 300),
                          child: SaleItem(
                            sale: _sale,
                            onDelete: () async {
                              await model.delete(_sale);
                            },
                            onEdit: () async {
                              await model.goto(
                                WriteInvoiceView.tag,
                                arguments: WriteInvoiceArguments(
                                  InvoiceType.sales,
                                  invoice: _sale,
                                ),
                              );
                              model.state = model.free;
                            },
                          ),
                        );
                      },
                      itemCount: model.sales.length,
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
                    ),
                  ],
                ),
        );
      },
    );
  }
}
