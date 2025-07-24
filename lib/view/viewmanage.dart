import 'package:flutter/material.dart';
import 'package:workmotion_test/component/widget_btn.dart';
import 'package:workmotion_test/view/employee/employee_view.dart';
import 'package:workmotion_test/view/outsource/outsource_view.dart';

class ViewManage extends StatefulWidget {
  const ViewManage({super.key});

  @override
  State<ViewManage> createState() => _ViewManageState();
}

class _ViewManageState extends State<ViewManage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listBTN = [
      MyBTN(
        textBTN: 'Employee',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EmployeeView()),
          );
        },
      ),
      MyBTN(
        textBTN: 'Outsource',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OutsourceView()),
          );
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Employee Management'), centerTitle: true),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: listBTN.length,
        itemBuilder: (context, index) {
          return listBTN[index];
        },
      ),
    );
  }
}
