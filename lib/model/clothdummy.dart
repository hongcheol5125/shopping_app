class Cloth{
  final String title;
  final String keyword;
  final String image;
  final bool like;

  Cloth(this.title, this.keyword, this.image, this.like);

  Cloth.fromMap(Map<String, dynamic> map)
  : title = map['title'],
  keyword = map['keyword'],
  image = map['image'],
  like = map['like'];

  @override
  String toString() => 'Movie<$title: $keyword>';
}