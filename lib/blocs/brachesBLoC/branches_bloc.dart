import 'package:bloc/bloc.dart';
import 'package:tbdd/blocs/brachesBLoC/branches_event.dart';
import 'package:tbdd/blocs/brachesBLoC/branches_state.dart';


class BranchesBloc extends Bloc<BranchesEvent,BranchesState>{
  BranchesBloc():super(BranchesInitial());
}