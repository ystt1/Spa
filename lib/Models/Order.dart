import 'package:tbdd/Models/Employee.dart';
import 'package:tbdd/Models/Service.dart';

class order {
  final String idBranch;
  final String idemployee;
  final DateTime timeDate;
  final DateTime timeStart;
  final String idservice;

  order({
    required this.idBranch,
    required this.idemployee,
    required this.timeDate,
    required this.timeStart,
    required this.idservice,
  });

}