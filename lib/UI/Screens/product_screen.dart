import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/Models/Product.dart';
import 'package:tbdd/blocs/ProductsBLoC/products_bloc.dart';
import 'package:tbdd/blocs/ProductsBLoC/products_event.dart';
import 'package:tbdd/blocs/ProductsBLoC/products_state.dart';
import 'package:tbdd/until/color.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(LoadProductEvent());
    // TODO: implement initState
    super.initState();
  }

  late bool _isLove = false;

  Widget ProductItemCard(Product product) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.pushNamed("productDetails", extra: {"product": product});
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2.2,
            height: 300,
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(color: CupertinoColors.secondarySystemFill),
              right: BorderSide(color: CupertinoColors.secondarySystemFill),
              bottom: BorderSide(color: CupertinoColors.secondarySystemFill),
              left: BorderSide(color: CupertinoColors.secondarySystemFill),
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                    image: NetworkImage(product.urlImage),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: MediaQuery.of(context).size.width / 2.2,
                    fit: BoxFit.cover),
                Text(product.name,
                    style: TextStyle(
                      color: color.colorWord,
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                Text(
                  "${product.price} đ",
                  style: const TextStyle(color: Colors.green),
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: 0,
            right: 10,
            child: GestureDetector(
              onTap: (){context.read<ProductBloc>().add(LoveProductEvent(product: product));},
              child: Container(
                  width: 50,
                  height: 50,
                  child: Icon(
                    product.Favorite
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    color: Colors.red,
                  )),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color.colorPrimary,
          title: const Text(
            "Products",
            style: TextStyle(color: CupertinoColors.white),
          ),
        ),
        body: Column(
          children: [
            Card(
              elevation: 3,
              shape: const RoundedRectangleBorder(),
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: CupertinoColors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width * 5 / 6,
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 3),
                          hintText: 'Search ...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          prefixIcon: const Icon(
                            CupertinoIcons.search,
                            size: 18,
                          ),
                        ),
                        onChanged: (e) {
                          context
                              .read<ProductBloc>()
                              .add(SearchProductsEvent(name: e));
                        },
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                          !_isLove
                              ? CupertinoIcons.heart
                              : CupertinoIcons.heart_fill,
                          color: !_isLove ? color.colorPrimary : Colors.red),
                      onTap: () {
                        setState(() {
                          _isLove = !_isLove;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: CupertinoColors.white,
                  child: Column(
                    children: [
                     SizedBox(height: 10,),
                      BlocBuilder<ProductBloc, ProductState>(

                        builder: (BuildContext context, ProductState state) {
                          List<Product> products=[];
                          _isLove?products=state.products:products=state.products.where((element) => element.Favorite==true).toList();
                          return Wrap(
                            runSpacing: 18,
                            spacing: 8,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              ...products.map((e) => ProductItemCard(e))
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
