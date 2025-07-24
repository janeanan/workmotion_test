import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmotion_test/view/viewmanage.dart';
import 'package:workmotion_test/viewmodel/employee_model.dart';

void main() {
  Get.put(EmployeeModel());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ViewManage());
  }
}
