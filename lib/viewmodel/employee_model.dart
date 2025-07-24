import 'package:get/get.dart';
import 'package:workmotion_test/model/employ.dart';
import 'package:workmotion_test/model/out_source.dart';
import 'package:workmotion_test/model/service/res_client.dart';
import 'package:workmotion_test/utills/dio_configuration.dart';
import 'package:workmotion_test/utills/enum.dart';
import 'package:workmotion_test/utills/utils.dart';

class EmployeeModel extends GetxController {
  ConnectionStatus _statusGetEmployee = ConnectionStatus.none;
  ConnectionStatus get statusGetEmployee => _statusGetEmployee;
  List<Employ> _responseGetEmployee = [];
  List<Employ> get responseGetEmployee => _responseGetEmployee;

  Future<void> setEmployeeList(List<Employ> employee) async {
    _statusGetEmployee = ConnectionStatus.loading;
    update();

    await Future.delayed(Duration(milliseconds: 1200));
    _responseGetEmployee = employee;

    _statusGetEmployee = ConnectionStatus.success;
    update();
  }

  void addEmployee(Employ employee) {
    _responseGetEmployee.add(employee);
    update();
  }

  void updateEmployee(Employ employee) {
    final index = _responseGetEmployee.indexWhere((e) => e.id == employee.id);
    if (index != -1) {
      _responseGetEmployee[index] = employee;
      update();
    }
  }

  void removeEmployeeById(String id) {
    _responseGetEmployee.removeWhere((e) => e.id == id);
    update();
  }

  ConnectionStatus _statusGetOutsource = ConnectionStatus.none;
  ConnectionStatus get statusGetOutsource => _statusGetOutsource;
  List<OutSource> _responseGetOutsource = [];
  List<OutSource> get responseGetOutsource => _responseGetOutsource;

  Future<void> getGetOutsourceList() async {
    Utils.checkInternetConnection().then((value) {
      if (value) {
        _statusGetOutsource = ConnectionStatus.loading;
        update();
        RestClient(DioConfiguration.getDioInstance())
            .getOutSource()
            .then((value) {
              _responseGetOutsource = value;
              _statusGetOutsource = ConnectionStatus.success;
              update();
            })
            .onError((error, stackTrace) {
              _statusGetOutsource = ConnectionStatus.failed;
              update();
            });
      } else {
        _statusGetOutsource = ConnectionStatus.noInternet;
        update();
      }
    });
  }

  void reset() {
    _statusGetEmployee = ConnectionStatus.none;
    _responseGetEmployee.clear();
    _statusGetOutsource = ConnectionStatus.none;
    _responseGetOutsource.clear();
    update();
  }
}
