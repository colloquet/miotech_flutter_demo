import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/mio_colors.dart';

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  static final Tween<double> _sizeTween = Tween<double>(begin: 0, end: 48);
  static final Tween<double> _opacityTween = Tween<double>(begin: 1, end: 0);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(color: MioColors.secondary),
          ),
        ),
      ),
    );
  }
}

class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with TickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> animation1;
  AnimationController controller;
  AnimationController controller1;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 1800),
      vsync: this,
    );
    controller1 = AnimationController(
      duration: Duration(milliseconds: 1800),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: const Cubic(0.165, 0.84, 0.44, 1),
    );
    animation1 = CurvedAnimation(
      parent: controller1,
      curve: const Cubic(0.165, 0.84, 0.44, 1),
    );
    startAnimation();
  }

  Future<void> startAnimation() async {
    controller.repeat();
    await Future<void>.delayed(Duration(milliseconds: 900));
    controller1.repeat();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: <AnimatedLogo>[
          AnimatedLogo(animation: animation),
          AnimatedLogo(animation: animation1)
        ],
      );

  @override
  void dispose() {
    controller.dispose();
    controller1.dispose();
    super.dispose();
  }
}
