


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/blocs/ProductsBLoC/products_event.dart';
import 'package:tbdd/blocs/ProductsBLoC/products_state.dart';
import 'package:tbdd/repositories/ProductRepository.dart';

import '../../Models/Product.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>
{
  final ProductRepository _productRepository=ProductRepository();

  ProductBloc():super(ProductInitial()){
    on<LoadProductEvent>((event, emit) async {
      List<Product> products=await getAllProduct();
      emit(ProductLoadedState(products));
    });
    on<SearchProductsEvent>((event, emit) async {
      List<Product> allProduct=await getAllProduct();
      List<Product> productFound=allProduct.where((element) => element.name.toLowerCase().contains(event.name.toLowerCase())).toList();
      return emit(ProductFoundState(productFound));
    });
    on<SameProductInitialEvent>((event, emit) async {
      List<Product> allProduct=await getAllProduct();
      List<Product> sameProducts=allProduct.where((element) => element.brand==event.product.brand&&element.id!=event.product.id).toList();
      return emit(ProductSameState(allProduct, sameProducts));
    });
    on<LoveProductEvent>((event, emit) async {
      if(event.product.Favorite==true)
          _productRepository.deleteFavoriteProduct(event.product);
      else
        _productRepository.createFavoriteProducts(event.product);

      List<Product> products=await getAllProduct();
      emit(ProductLoadedState(products));
    });

  }

  Future<List<Product>> getAllProduct()
  async {
    return await _productRepository.getAllProduct();
  }
}
