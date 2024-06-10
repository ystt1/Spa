import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/Models/CategoryService.dart';
import 'package:tbdd/Models/Service.dart';
import 'package:tbdd/blocs/ServicesBLoC/services_bloc.dart';
import 'package:tbdd/blocs/ServicesBLoC/services_event.dart';
import 'package:tbdd/blocs/ServicesBLoC/services_state.dart';
import 'package:tbdd/until/color.dart';

class AllService extends StatefulWidget {
  const AllService({super.key});

  @override
  State<AllService> createState() => _AllServiceState();
}

class _AllServiceState extends State<AllService> {
  @override
  void initState() {
    context.read<ServicesBloc>().add(ServiceLoadEvent());
    _isOpen = List<bool>.generate(
        99,
            (index) => false);
    super.initState();
  }

  late List<bool> _isOpen = List<bool>.generate(
      BlocProvider
          .of<ServicesBloc>(context)
          .state
          .ListCateService
          .length,
          (index) => false);
  late List<bool> _searchExpandedItemOpen;

  Widget ExpandedItemBody(Service service) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            elevation: 2,
            child: Container(
              child: Image(
                image: NetworkImage(service.imgUrl),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 180,
                  child: Text(
                    service.name,
                    style: TextStyle(fontSize: 20, color: color.colorWord),
                    softWrap: true,
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 180,
                  child: Text(service.detail,
                      maxLines: 1, overflow: TextOverflow.ellipsis)),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.time,
                          size: 16,
                        ),
                        Text(" ${service.duration}"),
                      ],
                    ),
                    Text(
                      "${service.price} đ",
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.55,
                height: 0.5,
                decoration: const BoxDecoration(color: Colors.black26),
              ),
            ],
          ),
          GestureDetector(child: Text(">"),
            onTap:() {
              context.pushNamed("serviceDetail",extra:{"service":service});
            },)
        ],
      ),
    );
  }

  ExpansionPanel ExpandedItem(int i, CategoryService categoryService) {
    return ExpansionPanel(
        canTapOnHeader: true,
        isExpanded: _isOpen[i],
        headerBuilder: (context, isOpen) {
          return Container(
              color: Colors.white38,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                categoryService.name,
                style: TextStyle(color: color.colorWord, fontSize: 20),
              ));
        },
        body: BlocBuilder<ServicesBloc, ServicesState>(
          builder: (BuildContext context, ServicesState state) {
            return Column(
              children: [
                ...categoryService.services
                    .map((e) => ExpandedItemBody(e))
                    .toList(),
              ],
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.colorPrimary,
        titleSpacing: 0,
        title: Text(
          "Category Service",
          style: TextStyle(color: CupertinoColors.white),
        ),
        iconTheme: IconThemeData(color: CupertinoColors.white),
      ),
      body: Column(
        children: [
          Card(
            elevation: 3,
            child: Container(
              height: 60,
              color: CupertinoColors.white,
              child: Card(
                shape: RoundedRectangleBorder(),
                color: CupertinoColors.white,
                elevation: 2,
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Search ...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2)),
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      size: 18,
                    ),
                  ),
                  onChanged: (e) {
                    context
                        .read<ServicesBloc>()
                        .add(ServiceSeachEvent(name: e));
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<ServicesBloc, ServicesState>(
                  builder: (BuildContext context, ServicesState state) {

                    return ExpansionPanelList(
                        elevation: 1,
                        dividerColor: Colors.blueGrey,
                        children: [
                          ...state.ListCateService
                              .asMap()
                              .entries
                              .map((e) => ExpandedItem(e.key, e.value))
                              .toList(),
                        ],
                        expansionCallback: (i, isOpen) =>
                        {
                          setState(()
                            => _isOpen[i] = isOpen

                          )
                        });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
