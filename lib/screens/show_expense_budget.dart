// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:ayuuto_app/providers/bugget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowExpenseBudget extends StatefulWidget {
  ShowExpenseBudget({Key? key}) : super(key: key);
  static const String id = 'ShowExpenseBudget';
  // final formKey = GlobalKey<FormState>();
  @override
  State<ShowExpenseBudget> createState() => _ShowExpenseBudgetState();
}

class _ShowExpenseBudgetState extends State<ShowExpenseBudget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BuggetProvider>(
      builder: (context, val, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Show Expense Budget',
          ),
        ),
        body: val.exBudLisit.isNotEmpty
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
                                    i < val.exBudLisit.length;
                                    i++) ...{
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        Text(val.exBudLisit[i].id),
                                      ),
                                      DataCell(
                                        Text(val.exBudLisit[i].expense),
                                      ),
                                      DataCell(
                                        Text(val.exBudLisit[i].amount),
                                      ),
                                      DataCell(
                                        Text(val.exBudLisit[i].description),
                                      ),
                                      DataCell(
                                        Text(val.exBudLisit[i].regDate),
                                      ),
                                      DataCell(
                                        IconButton(
                                          onPressed: () {
                                            final id = val.exBudLisit[i].id;
                                            val.removeExpenseBudget(
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
