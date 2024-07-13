import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class MyFadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  MyFadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('opacity', Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 50))
          .thenTween('y', Tween(begin: -10.0, end: 0.0),
              duration: const Duration(milliseconds: 50),
              curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
        delay: Duration(milliseconds: (50 * delay).round()),
        duration: tween.duration,
        tween: tween,
        child: child,
        builder: (context, value, child) => Opacity(
              opacity: value.get("opacity"),
              child: Transform.translate(
                  offset: Offset(0, value.get("y")), child: child),
            ));
  }
}

//500
