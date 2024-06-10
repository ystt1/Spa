import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/UI/Widgets/separate_line.dart';
import 'package:tbdd/blocs/newsBLoC/news_bloc.dart';
import 'package:tbdd/blocs/newsBLoC/news_event.dart';
import 'package:tbdd/until/color.dart';
import 'package:tbdd/until/function.dart';

import '../../Models/News.dart';

class ItemTabView extends StatelessWidget {
  final News news;

  const ItemTabView({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        GestureDetector(
          onTap: () {
            context.pushNamed("newsDetails", extra: {"news": news});
          },
          child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                      image: NetworkImage(news.imageUrl),
                      width: MediaQuery.of(context).size.width,
                      height: 270,
                      fit: BoxFit.cover),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    news.title,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.green, fontSize: 19),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.access_time, size: 15),
                        Text(
                          timeAgo(news.postedTime),
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 13,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SeparateLine(width: MediaQuery.of(context).size.width * 0.9)
                ],
              )),
        ),
        Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: (){context.read<NewsBloc>().add(EventFavoriteNews( news: news));},
              child: Container(
                width: 50,
                height: 50,
                child: Icon(
                  news.Favorite?
                  CupertinoIcons.heart_fill:
                  CupertinoIcons.heart
                  ,
                  color: Colors.red,size: 40,
                ),
              ),
            )),
      ],
    );
  }
}
