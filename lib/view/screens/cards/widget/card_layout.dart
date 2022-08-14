import 'dart:math';

import 'package:flutter/material.dart';
import 'package:six_cash/util/color_resources.dart';

import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class CardLayout extends StatefulWidget {
  const CardLayout({Key key}) : super(key: key);

  @override
  State<CardLayout> createState() => _CardLayoutState();
}

class _CardLayoutState extends State<CardLayout>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0009)
            ..rotateX(pi * _animation.value),
          child: GestureDetector(
              onTap: () {
                if (_animationStatus == AnimationStatus.dismissed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              },
              child: _animation.value <= 0.5 ? FrontCard() : BackCard()),
        ),
      ),
    ));
  }
}

class FrontCard extends StatelessWidget {
  const FrontCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Jimmy",
                  style: rubikMedium.copyWith(
                    color: ColorResources.getCardColorText(),
                    fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                  ),
                ),
                Spacer(),
                Text(
                  "USD 0.00",
                  style: rubikMedium.copyWith(
                    color: ColorResources.getCardColorText(),
                    fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              "XXXX XXXX XXXX XXX",
              style: rubikMedium.copyWith(
                color: ColorResources.getCardColorText(),
                fontSize: Dimensions.FONT_SIZE_OVER_OVER_LARGE,
              ),
            ),
            Spacer(),
            Row(
              children: [cardDate()],
            )
          ],
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15), blurRadius: 5)
          ],
          color: ColorResources.getCardColorFront()),
    );
  }

  cardDate() {
    return Column(
      children: [
        Text(
          "Valid date",
          style: rubikMedium.copyWith(
            color: ColorResources.getCardColorText(),
            fontSize: Dimensions.FONT_SIZE_DEFAULT,
          ),
        ),
        Text(
          "XX/XX",
          style: rubikMedium.copyWith(
            color: ColorResources.getCardColorText(),
            fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
          ),
        ),
      ],
    );
  }
}

class BackCard extends StatelessWidget {
  const BackCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15), blurRadius: 5)
          ],
          color: ColorResources.getCardColorBack()),
    );
  }
}
