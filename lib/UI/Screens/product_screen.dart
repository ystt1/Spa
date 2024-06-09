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

  late bool _isLove=false;

  Widget ProductItemCard(Product product)
  {
    return GestureDetector(
      onTap: (){context.pushNamed("productDetails",extra:{"product":product});},
      child: Container(
        width: MediaQuery.of(context).size.width/2.2,

        height: 300,
        decoration: BoxDecoration(border: Border(
          top:BorderSide(color: CupertinoColors.secondarySystemFill),
          right: BorderSide(color: CupertinoColors.secondarySystemFill),
          bottom: BorderSide(color: CupertinoColors.secondarySystemFill),
          left: BorderSide(color: CupertinoColors.secondarySystemFill),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(children: [Image(image: NetworkImage(product.urlImage),width: MediaQuery.of(context).size.width/2.2,height: MediaQuery.of(context).size.width/2.2,fit: BoxFit.cover),
              Container(padding: EdgeInsets.only(right: 10,top:10),alignment: Alignment.topRight,child: Icon(FontAwesomeIcons.heart,color: Colors.red,weight: 300),)]),
            Text(product.name,style: TextStyle(color: color.colorWord,fontSize: 20,),maxLines: 2,overflow: TextOverflow.ellipsis),
            Text("${product.price} đ",style: TextStyle(color: Colors.green),)
          ],

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color.colorPrimary,
          title: Text("Products",style: TextStyle(color: CupertinoColors.white),),
        ),
        body:Column(
          children: [
            Card( elevation:3,
              shape: RoundedRectangleBorder(),
              child: Container(
                padding: EdgeInsets.only(right: 10),
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: CupertinoColors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                       Container(
                         padding: EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width*5/6,
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 3),
                            hintText: 'Search ...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),

                            ),
                            prefixIcon: Icon(CupertinoIcons.search,size: 18,),
                          ),
                          onChanged:(e) {
                            context.read<ProductBloc>().add(SearchProductsEvent(name: e));
                          },
                        ),
                      ),

                    GestureDetector(child: Icon(!_isLove?CupertinoIcons.heart:CupertinoIcons.heart_fill,color: !_isLove?color.colorPrimary:Colors.red),
                      onTap: (){
                        setState(() {
                          _isLove=!_isLove;
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
                  padding: EdgeInsets.all(10),
                  color: CupertinoColors.white,
                  child: Column(
                    children: [
                      Image(image: NetworkImage("https://vanchuyensieutoc.com/Uploads/images/tin%20tuc/my-pham-loreal.jpg")),
                      SizedBox(height: 30),
                      BlocBuilder<ProductBloc,ProductState>(
                        builder: (BuildContext context, ProductState state) {return
                          Wrap(
                          runSpacing: 18,
                          spacing: 8,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            ...state.products.map((e) => ProductItemCard(e))
                          ],
                        );},

                      )
                    ],

                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}