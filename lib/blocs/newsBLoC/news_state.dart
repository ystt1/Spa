import '../../Models/News.dart';

abstract class NewsState {
  List<News> listAllNews = [];
  List<News> listHighlighNews=[];

  NewsState(this.listAllNews,this.listHighlighNews){
    if(listAllNews!=null)
      {
        this.listAllNews=listAllNews;
      }
    if (listHighlighNews != null) {
      this.listHighlighNews = listHighlighNews;
    }
  }
}

List<News> newsList = [
  News(
    id: 1,
    imageUrl:
        'https://img.freepik.com/free-photo/3d-rendering-illustration-letter-blocks-forming-word-news-white-background_181624-60840.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais',
    title: 'Featured News 1',
    details: 'Details of featured news 1.',
    postedTime: DateTime.now().subtract(Duration(days: 1)),
    isFeatured: true,
  ),
  News(
    id: 2,
    imageUrl:
        'https://img.freepik.com/free-photo/3d-rendering-illustration-letter-blocks-forming-word-news-white-background_181624-60840.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais',
    title: 'Featured News 2',
    details: 'Details of featured news 2.',
    postedTime: DateTime.now().subtract(Duration(days: 2)),
    isFeatured: true,
  ),
  News(
    id: 3,
    imageUrl:
        'https://img.freepik.com/free-photo/3d-rendering-illustration-letter-blocks-forming-word-news-white-background_181624-60840.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais',
    title: 'Non-featured News 1',
    details: 'Details of non-featured news 1.',
    postedTime: DateTime.now().subtract(Duration(days: 3)),
    isFeatured: false,
  ),
  News(
    id: 4,
    imageUrl:
        'https://img.freepik.com/free-photo/3d-rendering-illustration-letter-blocks-forming-word-news-white-background_181624-60840.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais',
    title: 'Non-featured News 2',
    details: 'Details of non-featured news 2.',
    postedTime: DateTime.now().subtract(Duration(days: 4)),
    isFeatured: false,
  ),
  News(
    id: 5,
    imageUrl:
        'https://img.freepik.com/free-photo/3d-rendering-illustration-letter-blocks-forming-word-news-white-background_181624-60840.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais',
    title: 'Non-featured News 3',
    details: 'Details of non-featured news 3.',
    postedTime: DateTime.now().subtract(Duration(days: 5)),
    isFeatured: false,
  ),
  News(
    id: 6,
    imageUrl:
        'https://img.freepik.com/free-photo/3d-rendering-illustration-letter-blocks-forming-word-news-white-background_181624-60840.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais',
    title: 'Non-featured News 4',
    details: 'Details of non-featured news 4.',
    postedTime: DateTime.now().subtract(Duration(days: 6)),
    isFeatured: false,
  ),
];

class NewsInitialState extends NewsState {
  static List<News> listHighlighNew=newsList.where((news) => news.isFeatured).toList();
  NewsInitialState():super(newsList,listHighlighNew);
}

