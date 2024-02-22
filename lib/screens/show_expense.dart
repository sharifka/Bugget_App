// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:ayuuto_app/providers/bugget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowExpenseScreen extends StatefulWidget {
  ShowExpenseScreen({Key? key}) : super(key: key);
  static const String id = 'ShowExpenseScreen';
  // final formKey = GlobalKey<FormState>();
  @override
  State<ShowExpenseScreen> createState() => _ShowExpenseScreenState();
}

class _ShowExpenseScreenState extends State<ShowExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BuggetProvider>(
      builder: (context, val, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Show Expense',
          ),
        ),
        body: val.expenseList.isNotEmpty
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
                            width: MediaQuery.of(context).size.width,
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
                                    'Edit',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                              rows: [
                                for (int i = 0;
                                    i < val.expenseList.length;
                                    i++) ...{
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        Text(val.expenseList[i].id),
                                      ),
                                      DataCell(
                                        Text(val.expenseList[i].expense),
                                      ),
                                      DataCell(
                                        IconButton(
                                          onPressed: () {
                                            final id = val.expenseList[i].id;
                                            // print(id);
                                            val.removeExpense(context, id);
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
