// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:ayuuto_app/providers/bugget_provider.dart';
import 'package:ayuuto_app/screens/screens.dart';
import 'package:ayuuto_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<dynamic, dynamic>> serviceData = [
    {'iconData': Icons.account_balance, 'serviceName': 'Accounts'},
    {'iconData': Icons.money, 'serviceName': 'Income'},
    {'iconData': Icons.payment, 'serviceName': 'Expense budget'},
    {'iconData': Icons.bug_report_rounded, 'serviceName': 'Expenses'},
    {'iconData': Icons.money, 'serviceName': 'Expense Payments'},
    // {'iconData': Icons.account_balance, 'serviceName': 'Account Blance'},
  ];
  @override
  void initState() {
    Provider.of<BuggetProvider>(context, listen: false).topExpense(context);
    Provider.of<BuggetProvider>(context, listen: false).fetchAccountBlance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BuggetProvider>(
      builder: (context, value, _) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Bugget App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                value.topExpense(context);
                value.fetchAccounts();
                value.fetchAccountBlance();
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   padding: EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Expense',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 18,
            //         ),
            //       ),
            //       Text(
            //         '92%',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 18,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ServiceInfoCard(
                  serviceName: 'Blance',
                  serviceAveragePrice: "\$${value.accountBlance}",
                ),
                // const SizedBox(height: 20),
                ContentHeader(title: 'Top Expense'),
                for (int i = 0; i < value.topExpenseList.length; i++) ...{
                  ServiceInfoCard(
                    serviceName: value.topExpenseList[i].expense,
                    serviceAveragePrice: value.topExpenseList[i].top,
                  ),
                },
              ],
            ),
            Expanded(
              child: GridView.builder(
                // padding: EdgeInsets.only(right: 20, bottom: 20, left: 20),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 2,
                  childAspectRatio: 2,
                ),
                itemCount: serviceData.length,
                itemBuilder: (context, index) => ServiceCard(
                  onTap: () {
                    // print(serviceData[index]['serviceName']);
                    if (serviceData[0]['serviceName'] ==
                        serviceData[index]['serviceName']) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountsScreen()),
                      );
                    } else if (serviceData[1]['serviceName'] ==
                        serviceData[index]['serviceName']) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IncomeScreen()),
                      );
                    } else if (serviceData[2]['serviceName'] ==
                        serviceData[index]['serviceName']) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExpenseBudgetScreen(),
                        ),
                      );
                    } else if (serviceData[3]['serviceName'] ==
                        serviceData[index]['serviceName']) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExpenseScreen(),
                        ),
                      );
                    } else if (serviceData[4]['serviceName'] ==
                        serviceData[index]['serviceName']) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExpensePaymentScreen(),
                        ),
                      );
                    }
                  },
                  iconData: serviceData[index]['iconData'],
                  service: serviceData[index]['serviceName'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceInfoCard extends StatelessWidget {
  const ServiceInfoCard({
    super.key,
    required this.serviceName,
    required this.serviceAveragePrice,
  });
  final String serviceName, serviceAveragePrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            serviceName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            serviceAveragePrice,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    this.onTap,
    required this.iconData,
    required this.service,
  });
  final void Function()? onTap;
  final IconData iconData;
  final String service;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          // height: 100,
          // width: 100,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 7,
                spreadRadius: 5,
                color: Colors.blue.withOpacity(0.5),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('Accounts'),
              ListTile(
                contentPadding: EdgeInsets.all(10),
                horizontalTitleGap: 2,
                iconColor: Colors.blue,
                textColor: Colors.blue,
                leading: Icon(iconData),
                title: Text(service),
                // trailing: Icon(Icons.arrow_right),
              )
            ],
          ),
        ),
      ),
    );
  }
}
