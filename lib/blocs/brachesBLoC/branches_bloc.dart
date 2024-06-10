import 'package:bloc/bloc.dart';
import 'package:tbdd/blocs/brachesBLoC/branches_event.dart';
import 'package:tbdd/blocs/brachesBLoC/branches_state.dart';
import 'package:tbdd/repositories/BranchRepository.dart';

import '../../Models/Branch.dart';



class BranchesBloc extends Bloc<BranchesEvent, BranchesState> {
  final BranchRepository _branchRepository=BranchRepository();
  List<Branch> branches=[];
  BranchesBloc() :super(BranchesInitial([])) {

    on<GetOtherBranchesEvent>((event, emit) async {
      branches=await _branchRepository.getBranches();
      // List<Branch> otherBranches = branches.where((branch) =>
      // branch.id != event.selectedBranch.id).toList();
      List<Branch> otherBranches= await _branchRepository.getOtherBranches(event.selectedBranch);
      return emit(BranchesLoaded(branches,otherBranches));
    });
  }
}