
abstract class ServicesEvent{
}

class ServiceLoadEvent extends ServicesEvent{

}

class ServiceSeachEvent extends ServicesEvent{
  final String name;
  ServiceSeachEvent({required this.name});
}