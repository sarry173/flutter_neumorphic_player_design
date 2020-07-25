import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final Color topColor;
  final Color bottomColor;

  ButtonWidget({
    Key key,
    @required this.child,
    this.bgColor = Colors.white,
    this.topColor = Colors.white,
    this.bottomColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MorphicContainer(
      color: bgColor,
      topColor: topColor,
      bottomColor: bottomColor,
      child: child,
    );
  }
}

class MorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;
  final EdgeInsets padding;
  final Color topColor;
  final Color bottomColor;

  MorphicContainer({
    Key key,
    this.child,
    this.bevel = 10.0,
    this.color,
    this.padding = const EdgeInsets.all(0.0),
    this.topColor,
    this.bottomColor,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _MorphicContainerState createState() => _MorphicContainerState();
}

class _MorphicContainerState extends State<MorphicContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: widget.padding,
        width: double.infinity,
        decoration: BoxDecoration(
            color: widget.color,
            // border: Border.all(
            //   color: Colors.grey[100], //Color(0xffF4FCFE),
            //   width: 1, //                   <--- border width here
            // ),
            shape: BoxShape.circle,
            boxShadow: _isPressed
                ? [
                    BoxShadow(
                      color: widget.topColor,
                      offset: Offset(3.0, 3.0),
                      blurRadius: 2.0,
                      // spreadRadius: 2.0,
                    ),
                    BoxShadow(
                      color: widget.bottomColor,
                      offset: Offset(-3.0, -3.0),
                      blurRadius: 2.0,
                      // spreadRadius: 2.0,
                    )
                  ]
                : [
                    BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 2.0,
                      offset: Offset(-10.0, -10.0),
                      color: widget.topColor,
                    ),
                    BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 2.0,
                      offset: Offset(10.0, 10.0),
                      color: widget.bottomColor,
                    ),
                  ]),
        child: widget.child,
      ),
    );
  }
}
