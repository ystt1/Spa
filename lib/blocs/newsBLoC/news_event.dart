import '../../Models/News.dart';

abstract class NewsEvent{

}

class NewsEventLoad extends NewsEvent{

}

class EventFavoriteNews extends NewsEvent{
  News news;
  EventFavoriteNews({required this.news});
}