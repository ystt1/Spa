import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/blocs/HomeScreenBLoC/home_screen_event.dart';
import 'package:tbdd/blocs/HomeScreenBLoC/home_screen_state.dart';
import 'package:tbdd/repositories/BranchRepository.dart';
import 'package:tbdd/repositories/NewsRepository.dart';
import '../../Models/Branch.dart';
import '../../Models/News.dart';
import '../../Models/Service.dart';
import '../../repositories/ServiceRepository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late List<Branch> branches;
  late List<Service> services;
  late List<News> news;
  final BranchRepository _branchRepository;
  final ServiceRepository _serviceRepository;
  final NewsRepository _newsRepository;

  HomeBloc(this._branchRepository, this._serviceRepository, this._newsRepository) : super(HomeStateIninitial()) {
    on<HomeEventLoad>((event, emit) async {
      branches = await _branchRepository.getBranches();
      services=await _serviceRepository.getHighlighBranches();
      news=await _newsRepository.getHighlighNews();
      emit(HomeLoadingState(branches, services, news));
    });
  }
}
