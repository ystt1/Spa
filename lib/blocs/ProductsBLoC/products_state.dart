import 'package:tbdd/Models/Product.dart';

abstract class ProductState{
  final List<Product> products;
  final List<Product> sameProducts;
  ProductState(this.products,this.sameProducts);
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

