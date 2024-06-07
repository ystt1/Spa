import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/UI/Widgets/news_screen_tab_view.dart';
import 'package:tbdd/UI/Widgets/refresh_widget.dart';
import 'package:tbdd/blocs/newsBLoC/news_bloc.dart';
import 'package:tbdd/blocs/newsBLoC/news_state.dart';

import '../../blocs/newsBLoC/news_event.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsBloc>().add(NewsEventLoad());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: BlocBuilder<NewsBloc, NewsState>(
              builder: (BuildContext context, state) {
            if (state is NewsLoadedState) {
              return Column(
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
                      ListView(shrinkWrap: true, children: [
                        ...state.listAllNews
                            .map((news) => ItemTabView(news: news))
                      ]),
                      ListView(shrinkWrap: true, children: [
                        ...state.listHighlighNews
                            .map((news) => ItemTabView(news: news))
                      ]),
                      ListView(shrinkWrap: true, children: [
                        ...state.listHighlighNews
                            .map((news) => ItemTabView(news: news))
                      ]),
                    ]),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }
}
