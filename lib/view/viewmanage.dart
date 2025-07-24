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
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF0F2027),
      appBar: AppBar(
        title: const Text('Employee Management'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2C5364),
                  Color(0xFF203A43),
                  Color(0xFF0F172A),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            shrinkWrap: true,
            itemCount: listBTN.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: listBTN[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
