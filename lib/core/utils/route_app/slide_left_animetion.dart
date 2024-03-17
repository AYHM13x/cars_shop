import 'package:flutter/material.dart';

class SlideLeft extends PageRouteBuilder {
  final Widget? child;

  SlideLeft({this.child})
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
            const begin = Offset(-1, 0);
            const end = Offset(0, 0);
            var tweenRight = Tween(
              begin: begin,
              end: end,
            );

            Animation<Offset> offsetAnimationRight =
                animationOne.drive(tweenRight);

            return SlideTransition(
              position: offsetAnimationRight,
              child: child,
            );
          },
        );
}
