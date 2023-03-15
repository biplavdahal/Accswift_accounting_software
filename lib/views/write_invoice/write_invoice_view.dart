import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/core/base/base_view_arguments.dart';
import 'package:accswift/helpers/ui_helpers.dart';
import 'package:accswift/views/write_invoice/write_invoice_arguments.dart';
import 'package:accswift/views/write_invoice/write_invoice_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:accswift/models/cash_party_model.dart';
import 'package:accswift/models/ledger_account_model.dart';
import 'package:accswift/models/product_model.dart';
import 'package:accswift/models/tax_model.dart';
import 'package:accswift/models/series_model.dart';
import 'package:accswift/models/project_model.dart';
import 'package:accswift/models/depot_location_model.dart';

class WriteInvoiceView extends StatelessWidget {
  static String tag = 'write-invoice-view';

  final BaseViewArguments? arguments;

  WriteInvoiceView(this.arguments, {Key? key}) : super(key: key);

  final List<String> _steps = ['Invoice Details', 'Invoice Items', 'Review'];

  @override
  Widget build(BuildContext context) {
    return BaseView<WriteInvoiceViewModel>(
      enableTouchRepeal: true,
      onModelReady: (model) async {
        await model.init(arguments as WriteInvoiceArguments);
      },
      builder: (ctx, model, child) {
        final List<Widget> _stepsContent = [
          _buildIvoiceDetails(context, model),
          _buildInvoiceItems(context, model),
          _buildReview(context, model),
        ];

        return Scaffold(
          appBar: AppBar(
            title: Text(model.viewTitle),
          ),
          body: model.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xFFf4f590),
                  ),
                )
              : Stepper(
                  onStepTapped: (value) => model.currentStep = value,
                  physics: const BouncingScrollPhysics(),
                  elevation: 0,
                  currentStep: model.currentStep,
                  onStepContinue: () {
                    if (model.currentStep < 2) {
                      model.currentStep++;
                    } else {
                      model.onSavePressed();
                    }
                  },
                  onStepCancel: () {
                    if (model.currentStep > 0) {
                      model.currentStep--;
                    }
                  },
                  controlsBuilder: (context, details) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (model.currentStep > 0)
                            TextButton(
                              child: const Text('Back'),
                              onPressed: () {
                                model.currentStep--;
                              },
                            )
                          else
                            Container(),
                          ElevatedButton(
                            onPressed: () {
                              if (model.currentStep < 2) {
                                model.currentStep++;
                              } else {
                                model.onSavePressed();
                              }
                            },
                            child: Text(
                              model.currentStep == 2 ? 'Save' : 'Continue',
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  steps: _steps
                      .map(
                        (title) => Step(
                          title: Text(title),
                          content: _stepsContent[model.currentStep],
                          isActive: model.currentStep == _steps.indexOf(title),
                          state: model.currentStep == _steps.indexOf(title)
                              ? StepState.editing
                              : model.currentStep > _steps.indexOf(title)
                                  ? StepState.complete
                                  : StepState.indexed,
                        ),
                      )
                      .toList(),
                ),
        );
      },
    );
  }

  Widget _buildIvoiceDetails(
    BuildContext context,
    WriteInvoiceViewModel model,
  ) {
    final TextEditingController _invoiceDateController = TextEditingController(
      text: model.invoiceDate,
    );

    final TextEditingController _vouceherNumberController =
        TextEditingController(
      text: model.voucherNumber,
    );

    return Column(
      children: [
        if (!model.isEdit)
          DropdownButton<SeriesModel>(
            underline: Container(),
            value: model.series,
            hint: const Text('Series'),
            isExpanded: true,
            items: model.serieses
                .map(
                  (e) => DropdownMenuItem<SeriesModel>(
                    child: Text(e.name),
                    value: e,
                  ),
                )
                .toList(),
            onChanged: (v) {
              model.onSeriesChanged(v!);
            },
          ),
        if (!model.isEdit) UISpace.spaceVrMd,
        if (!model.isEdit)
          TextField(
            controller: _vouceherNumberController,
            readOnly: model.voucherNumberType == 'Automatic',
            decoration: InputDecoration(
              labelText: 'Voucher Number',
              icon: const Icon(Ionicons.ticket_outline),
              helperText: model.voucherNumberType,
            ),
            onChanged: (val) {
              model.voucherNumber = val;
            },
          ),
        if (!model.isEdit) UISpace.spaceVrMd,
        DropdownButton<ProjectModel>(
          underline: Container(),
          value: model.project,
          hint: const Text('Projects'),
          isExpanded: true,
          items: model.projects
              .map(
                (e) => DropdownMenuItem<ProjectModel>(
                  child: Text(e.engName),
                  value: e,
                ),
              )
              .toList(),
          onChanged: (v) {
            model.project = v;
            model.state = model.free;
          },
        ),
        UISpace.spaceVrMd,
        DropdownButton<DepotLocationModel>(
          underline: Container(),
          value: model.depotLocation,
          hint: const Text('Depot/Location'),
          isExpanded: true,
          items: model.depotLocations
              .map(
                (e) => DropdownMenuItem<DepotLocationModel>(
                  child: Text(e.depotName),
                  value: e,
                ),
              )
              .toList(),
          onChanged: (v) {
            model.depotLocation = v;
            model.state = model.free;
          },
        ),
        UISpace.spaceVrMd,
        TextField(
          controller: _invoiceDateController,
          readOnly: true,
          onTap: () async {
            final _pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(
                const Duration(days: 365 * 2),
              ),
              lastDate: DateTime.now(),
            );

            if (_pickedDate != null) {
              final _formatted =
                  '${_pickedDate.year}-${_pickedDate.month < 10 ? '0${_pickedDate.month}' : _pickedDate.month}-${_pickedDate.day < 10 ? '0${_pickedDate.day}' : _pickedDate.day}';
              _invoiceDateController.text = _formatted;
              model.invoiceDate = _formatted;
              model.state = model.free;
            }
          },
          decoration: const InputDecoration(
            labelText: 'Invoice Date',
            icon: Icon(Ionicons.calendar_outline),
          ),
        ),
        UISpace.spaceVrMd,
        DropdownButton<CashPartyModel>(
          underline: Container(),
          value: model.cashPartyAccount,
          hint: const Text('Cash Party A/C'),
          isExpanded: true,
          items: model.cashParties
              .map(
                (e) => DropdownMenuItem<CashPartyModel>(
                  child: Text(e.ledgerName),
                  value: e,
                ),
              )
              .toList(),
          onChanged: (v) {
            model.cashPartyAccount = v;
            model.state = model.free;
          },
        ),
        UISpace.spaceVrMd,
        DropdownButton<LedgerAccountModel>(
          underline: Container(),
          value: model.invoiceAccount,
          hint: Text('${model.accountType} A/C'),
          isExpanded: true,
          items: model.ledgerAccounts
              .map(
                (e) => DropdownMenuItem<LedgerAccountModel>(
                  child: Text(e.ledgerName),
                  value: e,
                ),
              )
              .toList(),
          onChanged: (v) {
            model.invoiceAccount = v;
            model.state = model.free;
          },
        ),
      ],
    );
  }

  Widget _buildInvoiceItems(
    BuildContext context,
    WriteInvoiceViewModel model,
  ) {
    return Column(
      children: [
        ...model.invoiceItems.map((item) {
          final TextEditingController _quantityController =
              TextEditingController(
            text: item.quantity?.toString(),
          );
          _quantityController.addListener(() {
            item.quantity = double.tryParse(_quantityController.text);
          });

          final TextEditingController _rateController = TextEditingController(
            text: item.rate?.toString(),
          );
          _rateController.addListener(() {
            item.rate = double.tryParse(_rateController.text);
          });

          final TextEditingController _discountController =
              TextEditingController(
            text: (item.doDiscountedByPercentage
                        ? _calculateDiscountPercent(
                            discountedAmount: item.discount ?? 0,
                            totalAmount:
                                (item.rate ?? 0) * (item.quantity ?? 0),
                          )
                        : item.discount)
                    ?.toString() ??
                '0.0',
          );
          _discountController.addListener(() {
            if (item.doDiscountedByPercentage) {
              item.discount = _calculateDiscountedAmount(
                discountedPercent: double.tryParse(_discountController.text),
                totalAmount: (item.rate ?? 0) * (item.quantity ?? 0),
              );
            } else {
              item.discount = double.parse(_discountController.text);
            }
          });

          final TextEditingController _remarkController =
              TextEditingController(text: item.remarks ?? '');

          return Stack(
            clipBehavior: Clip.none,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(top: 28),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      DropdownButton<ProductModel>(
                        value: item.product,
                        underline: Container(),
                        hint: const Text('Product'),
                        isExpanded: true,
                        items: model.products
                            .map(
                              (e) => DropdownMenuItem<ProductModel>(
                                child:
                                    Text('${e.productCode} - ${e.productName}'),
                                value: e,
                              ),
                            )
                            .toList(),
                        onChanged: (v) {
                          item.product = v;
                          item.rate = model.accountType == 'Sales'
                              ? v?.salesRate
                              : v?.purchaseRate;
                          _rateController.text = item.rate.toString();
                          model.state = model.free;
                        },
                      ),
                      UISpace.spaceVrMd,
                      TextField(
                        controller: _quantityController,
                        decoration: const InputDecoration(
                          labelText: 'Quantity',
                          icon: Icon(Ionicons.medical_outline),
                        ),
                      ),
                      UISpace.spaceVrMd,
                      TextField(
                        controller: _rateController,
                        decoration: const InputDecoration(
                          labelText: 'Rate',
                          icon: Icon(Ionicons.medical_outline),
                        ),
                      ),
                      UISpace.spaceVrMd,
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _discountController,
                              decoration: InputDecoration(
                                labelText:
                                    'Disc(${item.doDiscountedByPercentage ? '%' : 'Amt'})',
                                icon: const Icon(Ionicons.medical_outline),
                              ),
                            ),
                          ),
                          UISpace.spaceHrSm,
                          DropdownButton(
                            underline: Container(),
                            items: const [
                              DropdownMenuItem(
                                child: Text('%'),
                                value: '%',
                              ),
                              DropdownMenuItem(
                                child: Text('Amt'),
                                value: 'amt',
                              ),
                            ],
                            onChanged: (val) {
                              if (val == '%') {
                                item.doDiscountedByPercentage = true;
                              } else {
                                item.doDiscountedByPercentage = false;
                              }

                              if (item.doDiscountedByPercentage) {
                                _discountController.text =
                                    _calculateDiscountPercent(
                                  discountedAmount: item.discount ?? 0,
                                  totalAmount:
                                      (item.rate ?? 0) * (item.quantity ?? 0),
                                ).toString();
                              } else {
                                _discountController.text =
                                    _calculateDiscountedAmount(
                                  discountedPercent:
                                      double.parse(_discountController.text),
                                  totalAmount:
                                      (item.rate ?? 0) * (item.quantity ?? 0),
                                ).toString();
                              }
                              model.state = model.free;
                            },
                            value: item.doDiscountedByPercentage ? '%' : 'amt',
                          )
                        ],
                      ),
                      UISpace.spaceVrMd,
                      DropdownButton<TaxModel>(
                        value: item.tax,
                        underline: Container(),
                        hint: const Text('Tax'),
                        isExpanded: true,
                        items: model.taxes
                            .map(
                              (e) => DropdownMenuItem<TaxModel>(
                                child: Text('${e.name} (${e.rate}%)'),
                                value: e,
                              ),
                            )
                            .toList(),
                        onChanged: (v) {
                          item.tax = v;
                          model.state = model.free;
                        },
                      ),
                      UISpace.spaceVrMd,
                      TextField(
                        controller: _remarkController,
                        decoration: const InputDecoration(
                          labelText: 'Remarks',
                          icon: Icon(Ionicons.text_outline),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 16,
                child: ActionChip(
                  label: const Icon(
                    Ionicons.trash_bin,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    model.onRemoveInvoiceItem(model.invoiceItems.indexOf(item));
                  },
                  backgroundColor: Colors.red,
                ),
              )
            ],
          );
        }).toList(),
        UISpace.spaceVrMd,
        OutlinedButton(
          onPressed: () {
            model.onAddNewInvoiceItem();
          },
          child: const Text('Add Item'),
        ),
      ],
    );
  }

  Widget _buildReview(
    BuildContext context,
    WriteInvoiceViewModel model,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.shade300,
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Voucher No: ${model.voucherNumber}'),
          UISpace.spaceVrSm,
          Text('Invoice Date: ${model.invoiceDate}'),
          UISpace.spaceVrSm,
          Text('${model.accountType} A/C: ${model.invoiceAccount?.ledgerName}'),
          UISpace.spaceVrSm,
          Text('Cash Party: ${model.cashPartyAccount?.ledgerName}'),
          const Divider(),
          UISpace.spaceVrSm,
          Container(
            padding: const EdgeInsets.all(6),
            color: const Color(0xFF71acdd),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Ionicons.bulb_outline,
                  size: 12,
                  color: Colors.white,
                ),
                UISpace.spaceHrSm,
                Text(
                  'Scroll horizontal to see full table.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          UISpace.spaceVrSm,
          Scrollbar(
            scrollbarOrientation: ScrollbarOrientation.bottom,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataRowHeight: 120,
                columns: [
                  const DataColumn(
                    label: Text('Product'),
                  ),
                  const DataColumn(
                    label: Text('Quantity'),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text('${model.accountType} Rate'),
                    numeric: true,
                  ),
                  const DataColumn(
                    label: Text('Discount'),
                    numeric: true,
                  ),
                  const DataColumn(
                    label: Text('Tax (%)'),
                    numeric: true,
                  ),
                  const DataColumn(
                    label: Text('Amount'),
                    numeric: true,
                  ),
                  const DataColumn(label: Text('Remark')),
                ],
                rows: model.invoiceItems.map((e) {
                  final _total = (e.quantity ?? 0) * (e.rate ?? 0);
                  final _discount = (e.discount ?? 0);
                  final _net = _total - _discount;
                  double _tax = e.tax == null || e.tax!.rate == 0
                      ? 0
                      : _net / 100 * e.tax!.rate;

                  return DataRow(
                    cells: [
                      DataCell(Text(
                          '${e.product?.productCode} - ${e.product?.productName}')),
                      DataCell(
                        Text(e.quantity.toString()),
                      ),
                      DataCell(Text(e.rate.toString())),
                      DataCell(Text((e.discount ?? 0).toString())),
                      DataCell(Text('${(e.tax?.rate) ?? 0}')),
                      DataCell(
                        FittedBox(
                          child: Text(
                            'Total: $_total\nDiscount: $_discount\nNet: $_net\nTax: $_tax',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      DataCell(Text(e.remarks ?? 'N/A')),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          const Divider(),
          Builder(
            builder: (ctx) {
              final _total = model.invoiceItems.fold<double>(0, (a, b) {
                return a + (b.quantity ?? 0) * (b.rate ?? 0);
              });

              final _totalDiscount = model.invoiceItems.fold<double>(0, (a, b) {
                return a + (b.discount ?? 0);
              });

              final _totalTax = model.invoiceItems.fold<double>(0, (a, b) {
                final _total = (b.quantity ?? 0) * (b.rate ?? 0);
                final _discount = (b.discount ?? 0);
                final _net = _total - _discount;
                double _tax = b.tax == null || b.tax!.rate == 0
                    ? 0
                    : _net / 100 * b.tax!.rate;

                return a + _tax;
              });

              final _grandTotal = _total - _totalDiscount + _totalTax;

              return Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Gross(Rs.): $_total'),
                    UISpace.spaceVrSm,
                    Text(
                      'Total Discounted: ($_totalDiscount)',
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    UISpace.spaceVrSm,
                    Text('Tax: $_totalTax'),
                    UISpace.spaceVrSm,
                    Text(
                      'Grand Total: $_grandTotal',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  double _calculateDiscountPercent({
    double? discountedAmount = 0,
    double? totalAmount = 0,
  }) {
    if (totalAmount == null || totalAmount == 0) {
      return 0;
    }

    if (discountedAmount == null || discountedAmount == 0) {
      return 0;
    }

    return double.parse(
        ((discountedAmount / totalAmount) * 100).toStringAsFixed(2));
  }

  double _calculateDiscountedAmount({
    double? discountedPercent = 0,
    double? totalAmount = 0,
  }) {
    if (totalAmount == null || totalAmount == 0) {
      return 0;
    }

    if (discountedPercent == null || discountedPercent == 0) {
      return 0;
    }

    return double.parse(
        ((discountedPercent / 100) * totalAmount).toStringAsExponential(2));
  }
}
