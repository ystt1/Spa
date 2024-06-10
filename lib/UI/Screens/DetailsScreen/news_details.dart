import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/blocs/newsBLoC/news_bloc.dart';
import 'package:tbdd/until/color.dart';

import '../../../Models/News.dart';

class NewsDetails extends StatefulWidget {
  final News? news;

  const NewsDetails({super.key, required this.news});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  late News news;

  @override
  void initState() {
    news = widget.news ??
        News(
          id: "10000",
          imageUrl:
              'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcTQZQgd1d7GS-mpwe4-zFyGVtAxMg9ct_nFsY845sks9zGisJxSXiaXysaXX1JQJm_o',
          title: 'ERROR',
          details: 'ERROR',
          postedTime: DateTime.now().subtract(Duration(days: 1000)),
          isFeatured: false,
        );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.colorPrimary,
        iconTheme: IconThemeData(color: CupertinoColors.white),
        title: Text("News Detail",style: TextStyle(color: CupertinoColors.white),),
        titleSpacing: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image(image: NetworkImage(news.imageUrl)),
            Text(
              news.title,
              style: TextStyle(fontSize: 25, color: color.colorWord),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  CupertinoIcons.time,
                  size: 17,
                ),
                Text(
                    " ${news.postedTime.day}/${news.postedTime.month}/${news.postedTime.year}")
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                news.details,
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
