import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/Models/Service.dart';
import 'package:tbdd/UI/Widgets/home_screen_branch_card.dart';
import 'package:tbdd/UI/Widgets/refresh_widget.dart';
import 'package:tbdd/blocs/HomeScreenBLoC/home_screen_bloc.dart';
import 'package:tbdd/blocs/HomeScreenBLoC/home_screen_event.dart';
import 'package:tbdd/blocs/HomeScreenBLoC/home_screen_state.dart';
import 'package:tbdd/blocs/ServicesBLoC/services_bloc.dart';
import 'package:tbdd/blocs/ServicesBLoC/services_event.dart';
import 'package:tbdd/blocs/ServicesBLoC/services_state.dart';
import 'package:tbdd/blocs/brachesBLoC/branches_bloc.dart';
import 'package:tbdd/blocs/brachesBLoC/branches_state.dart';
import 'package:tbdd/blocs/newsBLoC/news_bloc.dart';
import 'package:tbdd/until/color.dart';

import '../../Models/News.dart';
import '../Widgets/home_screen_contact_us.dart';
import '../Widgets/home_screen_feature_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
     context.read<HomeBloc>().add(HomeEventLoad());
  }

  Widget RowTitile(String txt1, String txt2, Function() function) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt1,
          style: TextStyle(fontWeight: FontWeight.bold, color: color.colorWord),
        ),
        GestureDetector(
          onTap: function,
          child: Text(
            txt2,
            style: TextStyle(color: color.colorWord),
          ),
        )
      ],
    );
  }
  Widget Banner(News news)
  {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Image(
            image: NetworkImage(
                news.imageUrl),width: MediaQuery.of(context).size.width,height: 260,fit: BoxFit.cover,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.colorPrimary,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          RichText(
            text: const TextSpan(
                style: TextStyle(color: Colors.white),
                children: <TextSpan>[
                  TextSpan(text: "Xin Chào "),
                  TextSpan(
                      text: "Phan Quốc Tuấn",
                      style: TextStyle(fontWeight: FontWeight.bold))
                ]),
          ),
          const Icon(
            CupertinoIcons.gift,
            size: 35,
            color: Colors.white,
          )
        ]),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
        if (state is HomeStateLoad) {

          return RefreshWidget(child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3.4,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...state.banner.map((e) => Banner(e)).toList()
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RowTitile("Dịch vụ nổi bật", "Xem tất cả >", () {
                    context.pushNamed("allService");
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      child:  Wrap(
                          runSpacing: 18,
                          spacing: 30,
                          alignment: WrapAlignment.start,
                          children: [
                            ...state.services
                                .map((ser) => FeaturedServices(
                              ser: ser,
                            ))
                                .toList()
                          ])),
                  SizedBox(
                    height: 25,
                  ),
                  RowTitile("Các chi nhánh", "(6 chi nhánh)", () {}),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: 310,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...state.branches
                              .map((branch) => BranchCard(branch: branch))
                              .toList(),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ContacsUs()
                ],
              ),
            ),
          ),
              onRefresh:()async {return  context.read<HomeBloc>().add(HomeEventLoad());}
          ) ;

        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.message,
              color: Colors.white,
            ),
            shape: CircleBorder(),
            backgroundColor: color.colorPrimary,
            heroTag: 'message',
          ),
          SizedBox(
            height: 7,
          ),
          FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.phone, color: Colors.white),
              shape: CircleBorder(),
              backgroundColor: color.colorPrimary,
              heroTag: 'phone'),
        ],
      ),
    );
  }
}
