import 'package:tbdd/Models/Branch.dart';

abstract class BranchesEvent {}

class GetOtherBranchesEvent extends BranchesEvent{
  final Branch selectedBranch;
  GetOtherBranchesEvent({required this.selectedBranch});
}