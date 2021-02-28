class Movie {
  final String title;
  final String keyword;
  final String poster;
  final bool like;

  // fromMap은 생성자같은 느낌적인 느낌느낌
  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  @override
  String toString() => "Movie<$title:$keyword>";
}
