// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:ayuuto_app/models/bugget_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BuggetProvider extends ChangeNotifier {
  var dropDownList = ['Select Expense'];
  var firstExpense = 'Select Expense';
  var dropDownListAcc = ['Select Account'];
  var firstAcc = 'Select Account';
  bool isLoading = false;
  String kEndpoint = 'http://172.20.0.135/bugget_app/api.php';
  TextEditingController account = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController institution = TextEditingController();
  TextEditingController blance = TextEditingController();
  TextEditingController expanse = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController income = TextEditingController();
  Future<void> registerAccount(BuildContext context) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'registerAccount',
        'account': account.text,
        'institution': institution.text,
        'blance': blance.text,
      });
      var data = jsonDecode(response.body);
      if (data[0]["msg"] == "Si sax ah ayaa lo xareeyay xogtan mahadsanid") {
        showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            content: Text('Si sax ah ayaa lo xareeyay xogtan mahadsanid'),
          ),
        );
      } else {
        showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            content: Text(data[0]['msg']),
          ),
        );
      }
      print(data);
      // print(data[0]['name']);
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> registerExpense(BuildContext context) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'registerExpense',
        'expanse': expanse.text,
        'state': state.text,
      });
      var data = jsonDecode(response.body);
      // print(data);
      if (data[0]["msg"] == "Si sax ah ayaa lo xareeyay xogtan mahadsanid") {
        showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            content: Text('Si sax ah ayaa lo xareeyay xogtan mahadsanid'),
          ),
        );
      } else {
        showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            content: Text(data[0]['msg']),
          ),
        );
      }
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  List<ViewTopExpenseModel> topExpenseList = [];
  Future<void> topExpense(BuildContext context) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'topExpense',
      });
      final List data = jsonDecode(response.body);
      topExpenseList =
          data.map((e) => ViewTopExpenseModel.fromJson(e)).toList();
      print(data);
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  List<ViewAccountModel> accountList = [];
  Future<void> fetchAccounts() async {
    isLoading = true;
    notifyListeners();
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'accountShow',
      });
      final List data = jsonDecode(response.body);
      print(data);
      accountList = data.map((e) => ViewAccountModel.fromJson(e)).toList();
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  List<ViewExpenseModel> expenseList = [];
  Future<void> fetchExpense() async {
    isLoading = true;
    notifyListeners();
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'expenseShow',
      });
      final List data = jsonDecode(response.body);
      print(data);
      expenseList = data.map((e) => ViewExpenseModel.fromJson(e)).toList();
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  String accountBlance = '0.00';
  Future<void> fetchAccountBlance() async {
    isLoading = true;
    notifyListeners();
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'accountBlance',
      });
      final List data = jsonDecode(response.body);
      print(data);
      accountBlance = data[0]['blance'];
      // expenseList = data.map((e) => ViewExpenseModel.fromJson(e)).toList();
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  List<ViewExpenseBudgetModel> exBudLisit = [];
  Future<void> fetchExpenseBudget() async {
    isLoading = true;
    notifyListeners();
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'expenseBudgetShow',
      });
      final List data = jsonDecode(response.body);
      print(data);
      exBudLisit = data.map((e) => ViewExpenseBudgetModel.fromJson(e)).toList();
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  List<ViewExpensePaymentModel> exPaymentList = [];
  Future<void> fetchExpensePayment() async {
    isLoading = true;
    notifyListeners();
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'expensePaymentShow',
      });
      final List data = jsonDecode(response.body);
      print(data);
      exPaymentList =
          data.map((e) => ViewExpensePaymentModel.fromJson(e)).toList();
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  List<ViewOtherIncomeModel> otherIncomeList = [];
  Future<void> fetchOtherIncome() async {
    isLoading = true;
    notifyListeners();
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'otherIncomeShow',
      });
      final List data = jsonDecode(response.body);
      print(data);
      otherIncomeList =
          data.map((e) => ViewOtherIncomeModel.fromJson(e)).toList();
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> removeAccounts(BuildContext context, String id) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'deleteAccount',
        'id': id,
      });
      var data = jsonDecode(response.body);
      print(data);
      // showDialog(
      //   // barrierDismissible: false,
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     content: Text(data['message']),
      //     actions: [TextButton(onPressed: () {}, child: Text('Ok'))],
      //   ),
      // );
      fetchAccounts();
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> removeExpenseBudget(BuildContext context, String id) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'deleteExpenseBudget',
        'id': id,
      });
      var data = jsonDecode(response.body);
      print(data);
      // if (data['status'] == false) {
      //   showDialog(
      //     // barrierDismissible: false,
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       content: Text(data['message']),
      //       actions: [TextButton(onPressed: () {}, child: Text('Ok'))],
      //     ),
      //   );
      // }
      fetchExpenseBudget();
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> removeExpensePayment(BuildContext context, String id) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'deleteExpensePayment',
        'id': id,
      });
      var data = jsonDecode(response.body);
      print(data);
      // showDialog(
      //   // barrierDismissible: false,
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     content: Text(data['message']),
      //     actions: [TextButton(onPressed: () {}, child: Text('Ok'))],
      //   ),
      // );
      fetchExpensePayment();
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> removeOtherIncome(BuildContext context, String id) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'deleteOtherIncome',
        'id': id,
      });
      var data = jsonDecode(response.body);
      print(data);
      // showDialog(
      //   // barrierDismissible: false,
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     content: Text(data['message']),
      //     actions: [TextButton(onPressed: () {}, child: Text('Ok'))],
      //   ),
      // );
      fetchOtherIncome();
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> removeExpense(BuildContext context, String id) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'deleteExpense',
        'id': id,
      });
      var data = jsonDecode(response.body);
      print(data);
      // showDialog(
      //   // barrierDismissible: false,
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     content: Text(data['message']),
      //     actions: [TextButton(onPressed: () {}, child: Text('Ok'))],
      //   ),
      // );
      fetchExpense();
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> registerExpenseBudget(BuildContext context) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'registerExpenseBudget',
        'expanse': firstExpense,
        'amount': amount.text,
        'desc': description.text,
      });
      var data = jsonDecode(response.body);
      // print(data);
      if (data[0]["msg"] == "Si sax ah ayaa lo xareeyay xogtan mahadsanid") {
        showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            content: Text('Si sax ah ayaa lo xareeyay xogtan mahadsanid'),
          ),
        );
      } else {
        showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            content: Text(data[0]['msg']),
          ),
        );
      }
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> registerExpensePayment(BuildContext context) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'registerExpensePayment',
        'expanse': firstExpense,
        'amount': amount.text,
        'acc': firstAcc,
        'desc': description.text,
      });
      var data = jsonDecode(response.body);
      // print(data);
      if (data[0]["msg"] == "Si sax ah ayaa lo xareeyay xogtan mahadsanid") {
        showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            content: Text('Si sax ah ayaa lo xareeyay xogtan mahadsanid'),
          ),
        );
      } else {
        showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            content: Text(data[0]['msg']),
          ),
        );
      }
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> registerIncome(BuildContext context) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'registerIncome',
        'income': income.text,
        'amount': amount.text,
        'acc': firstAcc,
        'desc': description.text,
      });
      var data = jsonDecode(response.body);
      // print(data);
      if (data[0]["msg"] == "Si sax ah ayaa lo xareeyay xogtan mahadsanid") {
        showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            content: Text('Si sax ah ayaa lo xareeyay xogtan mahadsanid'),
          ),
        );
      } else {
        showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            content: Text(data[0]['msg']),
          ),
        );
      }
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  void clear() {
    account.clear();
    description.clear();
    institution.clear();
    blance.clear();
    expanse.clear();
    state.clear();
    amount.clear();
    income.clear();
    // fillDropdownExpense(context)
    notifyListeners();
  }

  Future<void> fillDropdownExpense(BuildContext context) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'fillDropdownExpense',
      });
      var data = jsonDecode(response.body);

      removeDropDownExpense();
      bool bol = true;
      if (bol) {
        for (int i = 0; i < data.length; i++) {
          var fr = data[i].values.toList();
          dropDownList.add(fr[0]);
        }
        bol = false;
      }
      // print(data[0]['name']);
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  void removeDropDownExpense() {
    firstExpense = 'Select Expense';
    var len = dropDownList.length;
    for (int i = len - 1; i > 0; i--) {
      dropDownList.removeAt(i);
    }
    notifyListeners();
  }

  Future<void> fillDropdownAccount(BuildContext context) async {
    try {
      http.Response response = await http.post(Uri.parse(kEndpoint), body: {
        'action': 'fillDropdownAccount',
      });
      var data = jsonDecode(response.body);

      removeDropDownAccount();
      bool bol = true;
      if (bol) {
        for (int i = 0; i < data.length; i++) {
          var fr = data[i].values.toList();
          dropDownListAcc.add(fr[0]);
        }
        bol = false;
      }
      // print(data[0]['name']);
    } on SocketException {
      print('No internet Access FillDropdown');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  void removeDropDownAccount() {
    firstAcc = 'Select Account';
    var len = dropDownListAcc.length;
    for (int i = len - 1; i > 0; i--) {
      dropDownListAcc.removeAt(i);
    }
    notifyListeners();
  }

  DateTime expRegDate = DateTime.now();
  Future<void> selectedExpRegDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: expRegDate,
      firstDate: DateTime(1980),
      lastDate: DateTime(2060),
    );
    if (picked != null && picked != expRegDate) {
      expRegDate = picked;
    }
    notifyListeners();
  }
}
