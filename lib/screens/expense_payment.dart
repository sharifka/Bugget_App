// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ayuuto_app/providers/bugget_provider.dart';
import 'package:ayuuto_app/screens/show_expense_payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class ExpensePaymentScreen extends StatefulWidget {
  const ExpensePaymentScreen({super.key});

  @override
  State<ExpensePaymentScreen> createState() => _ExpensePaymentScreenState();
}

class _ExpensePaymentScreenState extends State<ExpensePaymentScreen> {
  @override
  void initState() {
    Provider.of<BuggetProvider>(context, listen: false).clear();
    Provider.of<BuggetProvider>(context, listen: false)
        .fillDropdownExpense(context);
    Provider.of<BuggetProvider>(context, listen: false)
        .fillDropdownAccount(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Payment '),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<BuggetProvider>(
        builder: (context, value, _) => Column(
          children: [
            ContentHeader(title: 'Expense Payment Form'),
            //expense
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
            // account
            CustomDropdownWidget(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              items: value.dropDownListAcc.map((String accName) {
                return DropdownMenuItem(
                  value: accName,
                  child: Text(accName),
                );
              }).toList(),
              onChanged: (newvalue) {
                setState(() {
                  value.firstAcc = newvalue.toString();
                });
              },
              value: value.firstAcc,
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
                value.registerExpensePayment(context);
                value.fillDropdownExpense(context);
                value.fillDropdownAccount(context);
                value.clear();
              },
            ),
            // show
            ButtonWidget(
              text: 'Show',
              color: Colors.blue,
              onPressed: () {
                value.fetchExpensePayment();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowExpensePayment()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
