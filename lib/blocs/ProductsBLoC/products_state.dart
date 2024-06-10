import 'package:tbdd/Models/Product.dart';

abstract class ProductState{
  late List<Product> products;
  late List<Product> sameProducts;
  ProductState(this.products,this.sameProducts);
}

class ProductInitial extends ProductState{
  ProductInitial():super([],[]);
}

class ProductLoadedState extends ProductState{
  ProductLoadedState(List<Product> product):super(product,[]){
  }
}

class ProductFoundState extends ProductState{
  ProductFoundState(List<Product> product):super(product,[]);
}

class ProductSameState extends ProductState{
  ProductSameState(List<Product> product,List<Product> sameProducts):super(product,sameProducts);
}

