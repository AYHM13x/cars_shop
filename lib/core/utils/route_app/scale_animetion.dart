import 'package:flutter/material.dart';

class ScaleAnmetion extends PageRouteBuilder {
  final Widget? child;

  ScaleAnmetion({this.child})
      : super(
          pageBuilder: (
            context,
            animationOne,
            animationTwo,
          ) =>
              child!,
          transitionsBuilder: (
            context,
            animationOne,
            animationTwo,
            child,
          ) {
            const begin = 0.0;
            const end = 1.0;
            var tween = Tween(
              begin: begin,
              end: end,
            );

            var curvesAnmition = CurvedAnimation(
              parent: animationOne,
              curve: Curves.easeInBack,
            );

            var offsetAnimationCurved = tween.animate(curvesAnmition);

            return ScaleTransition(
              scale: offsetAnimationCurved,
              child: child,
            );
          },
        );
}
