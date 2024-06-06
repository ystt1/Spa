import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/UI/Widgets/separate_line.dart';
import 'package:tbdd/until/function.dart';

import '../../Models/News.dart';

class ItemTabView extends StatelessWidget {
  final News news;

  const ItemTabView({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed("newsDetails", extra: {"news": news});
      },
      child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: NetworkImage(news.imageUrl)),
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
              SeparateLine(width: MediaQuery.of(context).size.width*0.9)
            ],
          )),
    );
  }
}
