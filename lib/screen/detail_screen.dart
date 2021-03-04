import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'dart:ui'; // 배경 이미지 블러처리를 위한 패키지

class DetailScreen extends StatefulWidget {
  final Movie movie;
  DetailScreen({this.movie});
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;
  @override
  void initState() {
    super.initState();
    like = widget.movie.like;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SafeArea(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/' + widget.movie.poster),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ClipRect(
                    child: BackdropFilter(
                      // 배경 이미지 블러처리
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black.withOpacity(0.1),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              // 상단 이미지 표시
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                                child: Image.asset(
                                    'images/' + widget.movie.poster),
                                height: 300,
                              ),
                              Container(
                                padding: EdgeInsets.all(7),
                                child: Text(
                                  '99% 일치 2019 15+ 시즌 1개',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              // 영화 제목
                              Container(
                                padding: EdgeInsets.all(7),
                                child: Text(
                                  widget.movie.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              // 재생버튼
                              Container(
                                padding: EdgeInsets.all(3),
                                child: FlatButton(
                                  onPressed: () {},
                                  color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.play_arrow),
                                      Text('재생'),
                                    ],
                                  ),
                                ),
                              ),
                              // 영화 정보
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Text(widget.movie.toString()),
                              ),
                              // 출연, 제작자 정보
                              Container(
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.centerLeft, // 왼쪽 정렬
                                child: Text(
                                  '출연: 현빈, 손예진, 서지혜\n제작자: 이정효, 박지은',
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // 닫기 버튼(팝업 다이얼로그에 적용되어 있어 기능선언을 해주지 않아도 정상 작동)
                Positioned(
                    child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                )),
              ],
            ),
            Container(
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // 내가 찜한 콘텐츠 버튼
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: <Widget>[
                          like ? Icon(Icons.check) : Icon(Icons.add),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text(
                            '내가 찜한 콘텐츠',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white60,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.thumb_up),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            '평가',
                            style:
                                TextStyle(fontSize: 11, color: Colors.white60),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.send),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text(
                            '공유',
                            style:
                                TextStyle(fontSize: 11, color: Colors.white60),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
