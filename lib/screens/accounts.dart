// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ayuuto_app/providers/bugget_provider.dart';
import 'package:ayuuto_app/screens/screens.dart';
import 'package:ayuuto_app/widgets/textfield_widget.dart';
import 'package:ayuuto_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/button_widget.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  void initState() {
    Provider.of<BuggetProvider>(context, listen: false).clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts'),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<BuggetProvider>(
        builder: (context, value, _) => Column(
          children: [
            ContentHeader(title: 'Accounts From'),
            //account name
            TextFieldWidget(
              readOnly: false,
              textInputAction: TextInputAction.next,
              controller: value.account,
              obscureText: false,
              autofocus: false,
              labelText: 'Account name',
              hintText: 'Enter Account name',
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

            //institution
            TextFieldWidget(
              readOnly: false,
              textInputAction: TextInputAction.next,
              controller: value.institution,
              obscureText: false,
              autofocus: false,
              labelText: 'Institution',
              hintText: 'Enter Institution',
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

            //Blance
            TextFieldWidget(
              readOnly: false,
              textInputAction: TextInputAction.next,
              controller: value.blance,
              obscureText: false,
              autofocus: false,
              labelText: 'Blance',
              hintText: 'Enter Blance',
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
                if (value.account.text != '' &&
                    value.institution.text != '' &&
                    value.blance.text != '') {
                  value.registerAccount(context);
                  value.clear();
                }
              },
            ),
            // show
            ButtonWidget(
              text: 'Show',
              color: Colors.blue,
              onPressed: () {
                value.fetchAccounts();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowAccountScreen(),
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
