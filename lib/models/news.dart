class News {
  News({
    required this.id,
    required this.title,
    required this.date,
    required this.image,
    required this.content,
    required this.writer,
    required this.category,
  });
  late int id;
  late String title;
  late String date;
  late String image;
  late String? content;
  late String writer;
  late List<String> category;

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    image = json['image'];
    content = json['content'];
    writer = json['writer'];
    category = List.castFrom<dynamic, String>(json['category']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['date'] = date;
    data['image'] = image;
    data['content'] = content;
    data['writer'] = writer;
    data['category'] = category;
    return data;
  }
}
