import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/Models/Product.dart';
import 'package:tbdd/UI/Widgets/separate_line.dart';
import 'package:tbdd/blocs/ProductsBLoC/products_bloc.dart';
import 'package:tbdd/blocs/ProductsBLoC/products_event.dart';
import 'package:tbdd/blocs/ProductsBLoC/products_state.dart';
import 'package:tbdd/until/color.dart';

class ProductDetails extends StatefulWidget {
  final Product? product;

  const ProductDetails({super.key, this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = widget.product ??
        Product(
            id: "404",
            urlImage:
                "https://thumbs.dreamstime.com/b/error-rubber-stamp-word-error-inside-illustration-109026446.jpg",
            name: "ERROR",
            price: "0",
            details: "ERROR",
            brand: "ERROR");
    context.read<ProductBloc>().add(SameProductInitialEvent(product: product));
  }

  late Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: NetworkImage(product.urlImage)),
            Container(
                constraints: BoxConstraints(minHeight: 300),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(color: color.colorWord, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${product.price} đ",
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(product.details),
                    SizedBox(
                      height: 10,
                    ),
                    SeparateLine(width: MediaQuery.of(context).size.width),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Same product",
                      style: TextStyle(fontSize: 17, color: color.colorWord),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: BlocBuilder<ProductBloc, ProductState>(
                        builder: (BuildContext context, ProductState state) {
                          print(state.sameProducts.length);
                          return ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ...state.sameProducts.map((e) {
                                    return GestureDetector(
                                      onTap: () {
                                        context.pushReplacementNamed(
                                            "productDetails",
                                            extra: {"product": e});
                                      },
                                      child: Image(
                                        image: NetworkImage(e.urlImage),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height: 80,
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  }).toList()
                                ],
                              ) ??
                              Text("");
                        },
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
