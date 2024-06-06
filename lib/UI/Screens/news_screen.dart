import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/UI/Widgets/news_screen_tab_view.dart';
import 'package:tbdd/blocs/newsBLoC/news_bloc.dart';
import 'package:tbdd/blocs/newsBLoC/news_state.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              const TabBar(tabs: [
                Tab(
                  text: "Tất cả",
                ),
                Tab(
                  text: "Nổi bật",
                ),
                Tab(
                  text: "Yêu thich",
                ),
              ]),
              Expanded(
                child: TabBarView(children: [
                  BlocBuilder<NewsBloc, NewsState>(
                      builder: (BuildContext context, state) {
                    return ListView(children: [
                      ...state.listAllNews
                          .map((news) => ItemTabView(news: news))
                    ]);
                  }),
                  BlocBuilder<NewsBloc, NewsState>(
                      builder: (BuildContext context, state) {
                    return ListView(children: [
                      ...state.listHighlighNews
                          .map((news) => ItemTabView(news: news))
                    ]);
                  }),
                  Container(
                    child: const Text("Yêu thích tab"),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
