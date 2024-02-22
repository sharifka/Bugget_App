// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ayuuto_app/providers/bugget_provider.dart';
import 'package:ayuuto_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  void initState() {
    Provider.of<BuggetProvider>(context, listen: false).clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense'),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<BuggetProvider>(
        builder: (context, value, _) => Column(
          children: [
            ContentHeader(title: 'Expense Form'),
            //exp name
            TextFieldWidget(
              readOnly: false,
              textInputAction: TextInputAction.next,
              controller: value.expanse,
              obscureText: false,
              autofocus: false,
              labelText: 'Expense name',
              hintText: 'Enter Expens name',
              color: Theme.of(context).textTheme.bodySmall!.color,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),

            //exp state
            TextFieldWidget(
              readOnly: false,
              textInputAction: TextInputAction.next,
              controller: value.state,
              obscureText: false,
              autofocus: false,
              labelText: 'Expense State',
              hintText: 'Enter Expense State',
              color: Theme.of(context).textTheme.bodySmall!.color,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            // save
            ButtonWidget(
              text: 'Save',
              color: Colors.blue,
              onPressed: () {
                value.registerExpense(context);
                value.clear();
              },
            ),
            // show
            ButtonWidget(
              text: 'Show',
              color: Colors.blue,
              onPressed: () {
                value.fetchExpense();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowExpenseScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
