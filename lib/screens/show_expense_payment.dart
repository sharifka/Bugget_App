// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:ayuuto_app/providers/bugget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowExpensePayment extends StatefulWidget {
  ShowExpensePayment({Key? key}) : super(key: key);
  static const String id = 'ShowExpensePayment';
  // final formKey = GlobalKey<FormState>();
  @override
  State<ShowExpensePayment> createState() => _ShowExpensePaymentState();
}

class _ShowExpensePaymentState extends State<ShowExpensePayment> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BuggetProvider>(
      builder: (context, val, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Show Expense Payment',
          ),
        ),
        body: val.exPaymentList.isNotEmpty
            ? val.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: DataTable(
                              headingRowColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                return Colors.blue;
                              }),
                              border: TableBorder.all(
                                width: 1.5,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color!,
                              ),
                              columns: [
                                DataColumn(
                                  label: Text(
                                    'Id',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Expense',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'amount',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Account',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Description',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'RegDate',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                              rows: [
                                for (int i = 0;
                                    i < val.exPaymentList.length;
                                    i++) ...{
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        Text(val.exPaymentList[i].id),
                                      ),
                                      DataCell(
                                        Text(val.exPaymentList[i].expense),
                                      ),
                                      DataCell(
                                        Text(val.exPaymentList[i].amount),
                                      ),
                                      DataCell(
                                        Text(val.exPaymentList[i].accountName),
                                      ),
                                      DataCell(
                                        Text(val.exPaymentList[i].description),
                                      ),
                                      DataCell(
                                        Text(val.exPaymentList[i].regDate),
                                      ),
                                      DataCell(
                                        IconButton(
                                          onPressed: () {
                                            final id = val.exPaymentList[i].id;
                                            val.removeExpensePayment(
                                                context, id);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                }
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
            : Center(child: Text('This Information Was Not Found!')),
      ),
    );
  }
}
