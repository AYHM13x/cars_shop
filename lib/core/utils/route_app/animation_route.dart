import 'package:flutter/material.dart';

class SlideRight extends PageRouteBuilder {
  final Widget? child;

  SlideRight({this.child})
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
            const begin = Offset(1, 0);
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




  // const beginRight = 0.0;
  //           const beginLeft = Offset(-1, 0);
  //           const end = 1.0;
  //           var tweenRight = Tween(
  //             begin: beginRight,
  //             end: end,
  //           );
  //           var curvesAnmition = CurvedAnimation(
  //             parent: animationOne,
  //             curve: Curves.linear,
  //             // reverseCurve: Curves.easeInBack,
  //           );
  //           //Animation<Offset> offsetAnimationRight = animationOne.drive(tweenRight);
  //           var offsetAnimationCurved = tweenRight.animate(curvesAnmition);
  //             //  return SlideTransition  slide animation
  //             // ScaleTransition         zoom in animation
  //           return RotationTransition(         // rotate animation
  //             turns: offsetAnimationCurved,
  //             child: child,
  //           );



//Tv animtion
//  return Align(
//               alignment: Alignment.bottomCenter,
//               child: SizeTransition(
//                 sizeFactor: animationOne,
//                 //axis: Axis.horizontal,
//                 child: child,
//               ),
//             );

//fade animation
//  return FadeTransition(
//               opacity: animationOne,
//               child: child,
//             );