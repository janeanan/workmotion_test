import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmotion_test/utills/enum.dart';
import 'package:workmotion_test/viewmodel/employee_model.dart';

class OutsourceView extends StatefulWidget {
  const OutsourceView({super.key});

  @override
  State<OutsourceView> createState() => _OutsourceViewState();
}

class _OutsourceViewState extends State<OutsourceView> {
  late EmployeeModel employeeModel;

  @override
  void initState() {
    super.initState();
    employeeModel = Get.find<EmployeeModel>();
    employeeModel.getGetOutsourceList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Outsource')),
      body: SingleChildScrollView(
        child: GetBuilder<EmployeeModel>(
          builder: (vm) {
            if (vm.statusGetOutsource == ConnectionStatus.loading) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 165,
                          child: Center(
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (vm.statusGetOutsource == ConnectionStatus.success) {
              var outsourceDatas = vm.responseGetOutsource;
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: outsourceDatas.length,
                itemBuilder: (context, index) {
                  var username = outsourceDatas[index].username;
                  var photo = outsourceDatas[index].photo;
                  var name = outsourceDatas[index].name;
                  var company = outsourceDatas[index].company;
                  var email = outsourceDatas[index].email;
                  var address = outsourceDatas[index].address;
                  var state = outsourceDatas[index].state;
                  var country = outsourceDatas[index].country;
                  var phone = outsourceDatas[index].phone;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: 18,
                                child: ClipOval(child: Image.network('$photo')),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '$name',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '$username',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Company: $company',
                                        style: const TextStyle(fontSize: 14),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Email: $email',
                                        style: const TextStyle(fontSize: 14),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Address: $address',
                                        style: const TextStyle(fontSize: 14),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'State: $state',
                                        style: const TextStyle(fontSize: 14),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Country: $country',
                                        style: const TextStyle(fontSize: 14),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Phone: $phone',
                                        style: const TextStyle(fontSize: 14),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  'Error GetOutsource',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
