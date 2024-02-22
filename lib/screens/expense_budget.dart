// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ayuuto_app/providers/bugget_provider.dart';
import 'package:ayuuto_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class ExpenseBudgetScreen extends StatefulWidget {
  const ExpenseBudgetScreen({super.key});

  @override
  State<ExpenseBudgetScreen> createState() => _ExpenseBudgetScreenState();
}

class _ExpenseBudgetScreenState extends State<ExpenseBudgetScreen> {
  @override
  void initState() {
    Provider.of<BuggetProvider>(context, listen: false).clear();
    Provider.of<BuggetProvider>(context, listen: false)
        .fillDropdownExpense(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Budget'),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<BuggetProvider>(
        builder: (context, value, _) => Column(
          children: [
            ContentHeader(title: 'Expense Budget Form'),
            CustomDropdownWidget(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              items: value.dropDownList.map((String expName) {
                return DropdownMenuItem(
                  value: expName,
                  child: Text(expName),
                );
              }).toList(),
              onChanged: (newvalue) {
                setState(() {
                  value.firstExpense = newvalue.toString();
                });
              },
              value: value.firstExpense,
            ),
            // amount
            TextFieldWidget(
              readOnly: false,
              textInputAction: TextInputAction.next,
              controller: value.amount,
              obscureText: false,
              autofocus: false,
              labelText: 'Amount',
              hintText: 'Enter Amount',
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

            //description
            TextFieldWidget(
              readOnly: false,
              textInputAction: TextInputAction.next,
              controller: value.description,
              obscureText: false,
              autofocus: false,
              labelText: 'Description',
              hintText: 'Enter Description',
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
                value.registerExpenseBudget(context);
                value.fillDropdownExpense(context);
                value.clear();
              },
            ),
            // show
            ButtonWidget(
              text: 'Show',
              color: Colors.blue,
              onPressed: () {
                value.fetchExpenseBudget();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowExpenseBudget()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
