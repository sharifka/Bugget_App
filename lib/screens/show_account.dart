// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:ayuuto_app/providers/bugget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowAccountScreen extends StatefulWidget {
  ShowAccountScreen({Key? key}) : super(key: key);
  static const String id = 'ShowAccountScreen';
  // final formKey = GlobalKey<FormState>();
  @override
  State<ShowAccountScreen> createState() => _ShowAccountScreenState();
}

class _ShowAccountScreenState extends State<ShowAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BuggetProvider>(
      builder: (context, val, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Show Accounts',
          ),
        ),
        body: val.accountList.isNotEmpty
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
                                    'Account',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Institution',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Balance',
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
                                    i < val.accountList.length;
                                    i++) ...{
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        Text(val.accountList[i].id),
                                      ),
                                      DataCell(
                                        Text(val.accountList[i].account),
                                      ),
                                      DataCell(
                                        Text(val.accountList[i].institution),
                                      ),
                                      DataCell(
                                        Text(val.accountList[i].blance),
                                      ),
                                      DataCell(
                                        IconButton(
                                          onPressed: () {
                                            final id = val.accountList[i].id;
                                            val.removeAccounts(context, id);
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
