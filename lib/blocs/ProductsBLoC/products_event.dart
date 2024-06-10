import 'package:tbdd/Models/Product.dart';

abstract class ProductEvent{

}

class LoadProductEvent extends ProductEvent{}

class SearchProductsEvent extends ProductEvent{
  final String name;
  SearchProductsEvent({required this.name});
}

class SameProductInitialEvent extends ProductEvent{
  final Product product;
  SameProductInitialEvent({required this.product});
}