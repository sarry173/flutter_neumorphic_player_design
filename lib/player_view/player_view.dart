import 'dart:async';

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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
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
  Timer _timer;
  int _start = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start >= 120) {
            timer.cancel();
          } else {
            _start = _start + 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
              child: Container(
                height: MediaQuery.of(context).size.width - 120,
                child: CustomPaint(
                  painter: NeuProgressPainter(
                    circleWidth: 15,
                    completedPercentage: _start.toDouble(),
                    defaultCircleColor: Colors.transparent,
                  ),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width - 150,
                    backgroundColor: Color(0xffF6FEFE),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width - 150,
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
