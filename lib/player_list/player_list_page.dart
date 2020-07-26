import 'package:flutter/material.dart';
import 'package:neu_morphic_player/player_view/player_view.dart';
import 'package:neu_morphic_player/widget/button_widget.dart';

class PlayerListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100, left: 15.0, right: 15.0),
        color: Color(0xffD9E8FC),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  child: ButtonWidget(
                    bgColor: Color(0xffD9E8FC),
                    bottomColor: Color(0xffB7C8DF),
                    topColor: Color(0xffFBFFFF),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.black38,
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: ButtonWidget(
                    bgColor: Color(0xffD9E8FC),
                    bottomColor: Color(0xffB7C8DF),
                    topColor: Color(0xffFBFFFF),
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF6FEFE),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CircleAvatar(
                          radius: 150,
                          backgroundImage: NetworkImage(
                              "https://is2-ssl.mzstatic.com/image/thumb/Music123/v4/7b/9a/eb/7b9aeb84-34d2-e7fc-31ae-869d7a5ff5a7/source/450x450bb.jpg"),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  child: ButtonWidget(
                    bgColor: Color(0xffD9E8FC),
                    bottomColor: Color(0xffB7C8DF),
                    topColor: Color(0xffFBFFFF),
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 15, bottom: 15, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Test Song ${index + 1}',
                              style: TextStyle(
                                fontSize: 19.0,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'ft. xyz.',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlayerViewPage()),
                            );
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            child: ButtonWidget(
                              bgColor: Color(0xffD9E8FC),
                              bottomColor: Color(0xffB7C8DF),
                              topColor: Color(0xffFBFFFF),
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
