import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;
  BoxSlider({this.movies}); // 생성자로 movies 목록을 가져옴
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('지금 뜨는 콘텐츠'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal, // 좌우로 스크롤
              children: makeBoxImages(movies),
            ),
          )
        ],
      ),
    );
  }
}

// Box Images 만드는 함수
List<Widget> makeBoxImages(List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(
      // InkWell: 일반적인 Container에 제스쳐 효과나 애니메이션 효과를 넣을 수 있음
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset('images/' + movies[i].poster),
        ),
      ),
    ));
  }
  return results;
}
