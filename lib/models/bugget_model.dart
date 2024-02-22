class ViewAccountModel {
  late String id, account, institution, blance;
  ViewAccountModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    account = json['Accoun'];
    institution = json['institution'];
    blance = json['Balance'];
  }
}

class ViewExpenseModel {
  late String id, expense;
  ViewExpenseModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    expense = json['Expense'];
  }
}

class ViewExpensePaymentModel {
  late String id, expense, amount, accountName, description, regDate;
  ViewExpensePaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    expense = json['Expense'];
    amount = json['Amount'];
    accountName = json['acc_name'];
    description = json['Description'];
    regDate = json['reg_Date'];
  }
}

class ViewExpenseBudgetModel {
  late String id, expense, amount, description, regDate;
  ViewExpenseBudgetModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    expense = json['Expense'];
    amount = json['Amount'];
    description = json['Description'];
    regDate = json['reg_Date'];
  }
}

class ViewOtherIncomeModel {
  late String id, income, amount, account, description, regDate;
  ViewOtherIncomeModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    income = json['Income'];
    amount = json['AMount'];
    account = json['Account'];
    description = json['description'];
    regDate = json['reg_date'];
  }
}

class ViewTopExpenseModel {
  late String expense, top;
  ViewTopExpenseModel.fromJson(Map<String, dynamic> json) {
    expense = json['Expense'];
    top = json['Top'];
  }
}
// ID: 1, Accoun: 61744166, institution: EVC, Balance: 900.000}, {ID: 2, Accoun: 2569, institution: salaam, Balance: 200.000}