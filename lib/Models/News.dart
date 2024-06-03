class News {
  final int id;
  final String imageUrl;
  final String title;
  final String details;
  final DateTime postedTime;
  final bool isFeatured;

  News({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.details,
    required this.postedTime,
    required this.isFeatured,
  });
}