import '../../Models/CategoryService.dart';
import '../../Models/Service.dart';

abstract class ServicesState{
  List<Service> listHighlishService=[];
  List<CategoryService> ListCateService=[];
  ServicesState(this.listHighlishService,this.ListCateService);
}


class ServicesInitial extends ServicesState{
  ServicesInitial():super([],[]);
}

class ServicesLoaded extends ServicesState{
  ServicesLoaded(List<Service> services,List<CategoryService>categories):super(services,categories);
}
class ServicesSearch extends ServicesState{
  ServicesSearch(List<Service> services,List<CategoryService>categories):super(services,categories);
}