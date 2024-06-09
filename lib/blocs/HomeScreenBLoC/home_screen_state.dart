import 'package:tbdd/Models/Branch.dart';

import '../../Models/News.dart';
import '../../Models/Service.dart';

abstract class HomeState{

}



class HomeStateIninitial extends HomeState{

}

class HomeLoadingState extends HomeState{

}

class HomeStateLoad extends HomeState{
   List<Branch> branches=[];
  List<Service> services=[];
  List<News> banner=[];
  HomeStateLoad(this.banner,this.services,this.branches);
}

