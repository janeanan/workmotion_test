import 'package:flutter/material.dart';
import 'package:workmotion_test/model/employ.dart';
import 'package:uuid/uuid.dart';

class EmployeeFormPage extends StatefulWidget {
  final Employ? employee;
  final void Function(Employ employee) onSave;

  const EmployeeFormPage({super.key, this.employee, required this.onSave});

  @override
  State<EmployeeFormPage> createState() => _EmployeeFormPageState();
}

class _EmployeeFormPageState extends State<EmployeeFormPage> {
  final nameCtrl = TextEditingController();
  final positionCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.employee != null) {
      nameCtrl.text = widget.employee!.name.toString();
      positionCtrl.text = widget.employee!.position.toString();
      emailCtrl.text = widget.employee!.email.toString();
      phoneCtrl.text = widget.employee!.phone.toString();
    }
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    positionCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    super.dispose();
  }

  void saveEmployee() {
    final name = nameCtrl.text;
    final position = positionCtrl.text;
    final email = emailCtrl.text;
    final phone = phoneCtrl.text;

    if (name.isEmpty || position.isEmpty || email.isEmpty || phone.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Some information is missing.'),
          content: const Text('Please provide complete information.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Continue'),
            ),
          ],
        ),
      );
      return;
    }

    final id = widget.employee?.id ?? const Uuid().v4();

    final newEmployee = Employ(
      id: id,
      name: name,
      position: position,
      email: email,
      phone: phone,
    );

    widget.onSave(newEmployee);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.employee == null ? 'Add Employee' : 'Edit Employee',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          TextField(
            controller: nameCtrl,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: positionCtrl,
            decoration: const InputDecoration(labelText: 'Position'),
          ),
          TextField(
            controller: emailCtrl,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: phoneCtrl,
            decoration: const InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: saveEmployee,
              child: const Text('Confirm'),
            ),
          ),
        ],
      ),
    );
  }
}
