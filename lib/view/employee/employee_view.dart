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
      appBar: AppBar(title: const Text('Employee')),
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
                return Card(
                  // margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Id: ${employee.id}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                'Name: ${employee.name}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                'Position: ${employee.position}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                'Email: ${employee.email}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                'Phone: ${employee.phone}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.mode_edit_rounded,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  showEmployeeForm(employee: employee);
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete_rounded,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  vm.removeEmployeeById(employee.id!);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: Text(
              'Error loading employees.',
              style: TextStyle(color: Colors.red),
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
            onPressed: () {
              showEmployeeForm();
            },
            child: const Text('Add Employee'),
          ),
        ),
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
