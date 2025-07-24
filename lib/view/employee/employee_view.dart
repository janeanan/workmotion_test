import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmotion_test/model/employ.dart';
import 'package:workmotion_test/utills/enum.dart';
import 'package:workmotion_test/view/employee/employee_form_page.dart';
import 'package:workmotion_test/viewmodel/employee_model.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  late EmployeeModel employeeModel;

  final List<Map<String, dynamic>> _mockEmployeeJson = [
    {
      "id": "110ec58a-a0f2-4ac4-8393-c866d813b8d1",
      "name": "Moises Wehner",
      "position": "Mobile Developer",
      "email": "Ross.Stehr@gmail.com",
      "phone": "0888888888",
    },
    {
      "id": "6c84fb90-12c4-11e1-840d-7b25c5ee775a",
      "name": "Front-End Developer",
      "position": "Feil - Kutch",
      "email": "Feil@gmail.com",
      "phone": "0899999999",
    },
  ];

  @override
  void initState() {
    super.initState();
    employeeModel = Get.put(EmployeeModel());

    final mockEmployees = _mockEmployeeJson
        .map((e) => Employ.fromJson(e))
        .toList();

    employeeModel.setEmployeeList(mockEmployees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('Employee'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<EmployeeModel>(
        builder: (vm) {
          if (vm.statusGetEmployee == ConnectionStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.statusGetEmployee == ConnectionStatus.success) {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: vm.responseGetEmployee.length,
              itemBuilder: (context, index) {
                final employee = vm.responseGetEmployee[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white30),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                infoText('ID', employee.id),
                                infoText('Name', employee.name),
                                infoText('Position', employee.position),
                                infoText('Email', employee.email),
                                infoText('Phone', employee.phone),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.mode_edit_rounded,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  showEmployeeForm(employee: employee);
                                },
                              ),
                              SizedBox(height: 50),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete_rounded,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: const Text('Confirm Deletion'),
                                      content: const Text(
                                        'Are you sure you want to delete this employee?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            vm.removeEmployeeById(employee.id!);
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: Text(
              'Error loading employees.',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blueAccent.shade700,
            ),
            onPressed: () {
              showEmployeeForm();
            },
            child: const Text('Add Employee'),
          ),
        ),
      ),
    );
  }

  Widget infoText(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value ?? '-',
              style: const TextStyle(fontSize: 13, color: Colors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  void showEmployeeForm({Employ? employee}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final mediaQuery = MediaQuery.of(context);
        final keyboardHeight = mediaQuery.viewInsets.bottom;
        double heightFactor = keyboardHeight > 0 ? 0.8 : 0.5;

        return FractionallySizedBox(
          heightFactor: heightFactor,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: EmployeeFormPage(
              employee: employee,
              onSave: (newEmployee) {
                if (employee == null) {
                  employeeModel.addEmployee(newEmployee);
                } else {
                  employeeModel.updateEmployee(newEmployee);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
