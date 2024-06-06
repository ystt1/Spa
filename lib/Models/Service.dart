class Service {
  final String id;
  final String imgUrl;
  final String name;
  final String duration;
  final String detail;
  final bool isHighlight;
  final double price;
  final String categoryId;

  Service({
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.duration,
    required this.detail,
    required this.isHighlight,
    required this.price,
    required this.categoryId,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      imgUrl: json['imgUrl'],
      name: json['name'],
      duration: json['duration'],
      detail: json['detail'],
      isHighlight: json['isHighlight'],
      price: json['price'],
      categoryId: json['categoryId'],
    );
  }


}