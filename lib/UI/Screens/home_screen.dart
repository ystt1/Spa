import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/Models/Service.dart';
import 'package:tbdd/UI/Widgets/home_screen_branch_card.dart';
import 'package:tbdd/blocs/ServicesBLoC/services_bloc.dart';
import 'package:tbdd/blocs/ServicesBLoC/services_state.dart';
import 'package:tbdd/blocs/brachesBLoC/branches_bloc.dart';
import 'package:tbdd/blocs/brachesBLoC/branches_state.dart';
import 'package:tbdd/until/color.dart';

import '../Widgets/home_screen_contact_us.dart';
import '../Widgets/home_screen_feature_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Widget RowTitile(String txt1, String txt2){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        txt1,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: color.colorWord),
      ),
      Text(
        txt2,
        style: TextStyle(color: color.colorWord),
      )
    ],
  );
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BranchesBloc>(
            create: (BuildContext context) => BranchesBloc()),
        BlocProvider<ServicesBloc>(
            create: (BuildContext context) => ServicesBloc())
      ],
      child: Scaffold(
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
            const Icon(CupertinoIcons.gift,size: 35,color: Colors.white,)
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3.4,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: const Image(
                            image: NetworkImage(
                                "https://storage-vnportal.vnpt.vn/sla-ubnd/4775/NTM/4_May_2024_021321_GMTthong-bao_553f5.png")),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: const Image(
                            image: NetworkImage(
                                "https://storage-vnportal.vnpt.vn/sla-ubnd/4775/NTM/4_May_2024_021321_GMTthong-bao_553f5.png")),
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 5,),
                RowTitile("Dịch vụ nổi bật", "Xem tất cả >"),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: BlocBuilder<ServicesBloc, ServicesState>(
                      builder: (BuildContext context, state) {
                    List<Service> services = state.listService.take(3).toList();
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...services
                              .map((ser) => FeaturedServices( ser: ser,))
                              .toList()
                        ]);
                  }),
                ),
                SizedBox(height: 25,),
                RowTitile("Các chi nhánh", "(6 chi nhánh)"),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    height: 310,
                    child: BlocBuilder<BranchesBloc, BranchesState>(
                      builder: (BuildContext context, state) {
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...state.brachList
                                .map((branch) => BranchCard( branch:branch))
                                .toList(),
                          ],
                        );
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                ContacsUs()
              ],
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(onPressed:() {},child: Icon(Icons.message,color: Colors.white,),shape: CircleBorder(),backgroundColor: color.colorPrimary,),
            SizedBox(height: 7,),
            FloatingActionButton(onPressed:() {},child: Icon(Icons.phone,color: Colors.white),shape: CircleBorder(),backgroundColor: color.colorPrimary,),
          ],
        ),
      ),
    );
  }
}
