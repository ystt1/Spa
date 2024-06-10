import '../../Models/CategoryService.dart';
import '../../Models/Service.dart';

abstract class ServicesState{
  List<CategoryService> ListCateService=[];
  ServicesState(this.ListCateService);
}


class ServicesInitial extends ServicesState{
  ServicesInitial():super([]);
}

class ServicesLoaded extends ServicesState{
  ServicesLoaded(List<CategoryService>categories):super(categories);
}
class ServicesSearch extends ServicesState{
  ServicesSearch(List<CategoryService>categories):super(categories);
}