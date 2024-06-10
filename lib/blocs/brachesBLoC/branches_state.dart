



import '../../Models/Branch.dart';


abstract class BranchesState{
  List<Branch> branchList=[];
  List<Branch> otherList=[];
  BranchesState(this.branchList,this.otherList){

  }
}


class BranchesInitial extends BranchesState{
  BranchesInitial(List<Branch> branches):super(branches,[]);
}


class BranchesLoaded extends BranchesState {
  BranchesLoaded(List<Branch> branches, List<Branch> otherBranches)
      : super(branches, otherBranches);
}