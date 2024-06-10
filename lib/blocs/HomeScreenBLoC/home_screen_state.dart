import 'package:tbdd/Models/Branch.dart';

import '../../Models/News.dart';
import '../../Models/Service.dart';

abstract class HomeState{
  List<Branch> branches=[];
  List<Service> services=[];
  List<News> banner=[];
  HomeState(this.branches,this.services,this.banner);
}

class HomeStateIninitial extends HomeState{
  HomeStateIninitial():super([],[],[]);
}
class HomeLoadingState extends HomeState{
  HomeLoadingState(List<Branch> branches,
  List<Service> services,
  List<News> banner):super(branches,services,banner);
}



