import 'package:flutter/material.dart';
import 'package:neu_morphic_player/widget/button_widget.dart';
import 'package:neu_morphic_player/widget/neu_progress_painter.dart';

class PlayerViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: Color(0xffD9E8FC),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
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
                        Icons.arrow_back_ios,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  Text(
                    'Playing Now',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
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
                        Icons.menu,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    ProgressCover(),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Lock It Up',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Eminem feat. Anderson .Paak',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: MediaQuery.of(context).padding.top),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: ButtonWidget(
                      bgColor: Color(0xffD9E8FC),
                      bottomColor: Color(0xffB7C8DF),
                      topColor: Color(0xffFBFFFF),
                      child: Icon(
                        Icons.fast_rewind,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    child: ButtonWidget(
                      bgColor: Color(0xff6894F6),
                      bottomColor: Color(0xffB7C8DF),
                      topColor: Color(0xffFBFFFF),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    child: ButtonWidget(
                      bgColor: Color(0xffD9E8FC),
                      bottomColor: Color(0xffB7C8DF),
                      topColor: Color(0xffFBFFFF),
                      child: Icon(
                        Icons.fast_forward,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressCover extends StatefulWidget {
  const ProgressCover({
    Key key,
  }) : super(key: key);

  @override
  _ProgressCoverState createState() => _ProgressCoverState();
}

class _ProgressCoverState extends State<ProgressCover> {
  int timerCount = 0;
  @override
  void initState() {
    super.initState();
    countDownTimer();
  }

  countDownTimer() async {
    for (int x = 0; x <= 120; x--) {
      await Future.delayed(Duration(seconds: 1)).then((_) {
        setState(() {
          timerCount += 1;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Expanded(
          child: Container(
            height: MediaQuery.of(context).size.width - 100,
            width: MediaQuery.of(context).size.width - 100,
            child: ButtonWidget(
              bgColor: Color(0xffD9E8FC),
              bottomColor: Color(0xffB7C8DF),
              topColor: Color(0xffFBFFFF),
              child: SizedBox(
                height: 300,
                child: CustomPaint(
                  painter: NeuProgressPainter(
                    circleWidth: 15,
                    completedPercentage: timerCount.toDouble(),
                    defaultCircleColor: Colors.transparent,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Color(0xffF6FEFE),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 300,
                        backgroundImage: NetworkImage(
                            "https://is2-ssl.mzstatic.com/image/thumb/Music123/v4/7b/9a/eb/7b9aeb84-34d2-e7fc-31ae-869d7a5ff5a7/source/450x450bb.jpg"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
