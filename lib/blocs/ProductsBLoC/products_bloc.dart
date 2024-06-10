


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/blocs/ProductsBLoC/products_event.dart';
import 'package:tbdd/blocs/ProductsBLoC/products_state.dart';
import 'package:tbdd/repositories/ProductRepository.dart';

import '../../Models/Product.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>
{
  final ProductRepository _productRepository=ProductRepository();
  List<Product> products=[];
  ProductBloc():super(ProductInitial()){
    on<LoadProductEvent>((event, emit) async {
      products=await _productRepository.getAllProduct();
      emit(ProductLoadedState(products));
    });
    on<SearchProductsEvent>((event, emit) {
      List<Product> listFound=products.where((element) => element.name.toLowerCase().contains(event.name.toLowerCase())).toList();
      return emit(ProductFoundState(listFound));
    });
    on<SameProductInitialEvent>((event, emit) {
      List<Product> sameProducts=products.where((element) => element.brand==event.product.brand&&element!=event.product).toList();
      return emit(ProductSameState(products, sameProducts));
    });
  }

}

List<Product> listProduct = [
  Product(id: "1", urlImage: "https://file.hstatic.net/1000269337/article/thuong_hieu_dior_cua_nuoc_nao__dior_co_gi_yy_1ffd45fa37bd4f8bb686cb93a7b28a28_1024x1024.jpg", name: "Dior Perfume", price: "99.99", details: "A luxurcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\\n\n\n\n\n\n\n\n\nious fragrance by Dior.", brand: "Dior"),
  Product(id: "2", urlImage: "https://myphamhuyenco.com.vn/Resources/HuyenCo/Files/Gioi-thieu/5-hang-my-pham-Han-Quoc-danh-tieng-tao-nen-con-sot-lam-dep-toan-cau-7.jpg", name: "Korean Beauty Set", price: "79.99", details: "A comprehensive beauty set from Korea.", brand: "K-Beauty"),
  Product(id: "3", urlImage: "https://vanchuyensieutoc.com/Uploads/images/tin%20tuc/my-pham-sk-II.jpg", name: "SK-II Facial Treatment Essence", price: "120.00", details: "A revitalizing treatment essence.", brand: "SK-II"),
  Product(id: "4", urlImage: "https://file.hstatic.net/1000269337/article/thuong_hieu_dior_cua_nuoc_nao__dior_co_gi_yy_1ffd45fa37bd4f8bb686cb93a7b28a28_1024x1024.jpg", name: "Chanel No. 5", price: "150.00", details: "Iconic fragrance by Chanel.", brand: "Chanel"),
  Product(id: "5", urlImage: "https://vanchuyensieutoc.com/Uploads/images/tin%20tuc/my-pham-sk-II.jpg", name: "Lancome Genifique", price: "110.00", details: "Youth activating serum by Lancome.", brand: "Lancome"),
  Product(id: "6", urlImage: "https://myphamhuyenco.com.vn/Resources/HuyenCo/Files/Gioi-thieu/5-hang-my-pham-Han-Quoc-danh-tieng-tao-nen-con-sot-lam-dep-toan-cau-7.jpg", name: "Estee Lauder Night Repair", price: "99.50", details: "Advanced night repair serum.", brand: "Dior"),
  Product(id: "7", urlImage: "https://vanchuyensieutoc.com/Uploads/images/tin%20tuc/my-pham-sk-II.jpg", name: "Clinique Moisture Surge", price: "49.99", details: "72-hour auto-replenishing hydrator.", brand: "Clinique"),
  Product(id: "8", urlImage: "https://file.hstatic.net/1000269337/article/thuong_hieu_dior_cua_nuoc_nao__dior_co_gi_yy_1ffd45fa37bd4f8bb686cb93a7b28a28_1024x1024.jpg", name: "MAC Lipstick", price: "19.00", details: "Matte lipstick by MAC.", brand: "MAC"),
  Product(id: "9", urlImage: "https://myphamhuyenco.com.vn/Resources/HuyenCo/Files/Gioi-thieu/5-hang-my-pham-Han-Quoc-danh-tieng-tao-nen-con-sot-lam-dep-toan-cau-7.jpg", name: "YSL Touche Eclat", price: "42.00", details: "Radiant touch highlighter.", brand: "Dior"),
  Product(id: "10", urlImage: "https://file.hstatic.net/1000269337/article/thuong_hieu_dior_cua_nuoc_nao__dior_co_gi_yy_1ffd45fa37bd4f8bb686cb93a7b28a28_1024x1024.jpg", name: "Bobbi Brown Vitamin Enriched Face Base", price: "60.00", details: "Moisturizer and primer in one.", brand: "Dior"),
];