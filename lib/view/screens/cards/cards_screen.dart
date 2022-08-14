import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/view/screens/cards/widget/card_button.dart';
import 'package:six_cash/view/screens/cards/widget/card_detail.dart';
import 'package:six_cash/view/screens/cards/widget/card_layout.dart';

import '../../base/appbar_home_element.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  var widgetSection = [Container(), CardDetail(), Container()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHomeElement(title: 'cards'.tr),
      body: Column(
        children: [
          UserCardSection(
            onChange: (v) {
              setState(() {
                index = v;
              });
            },
          ),
          Expanded(
              child: SingleChildScrollView(
            child: widgetSection[index],
          ))
        ],
      ),
    );
  }
}

class UserCardSection extends StatelessWidget {
  final Function(int) onChange;
  const UserCardSection({Key key, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardLayout(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardButton(
              onTap: () {
                onChange(0);
              },
              title: "card_history",
              color: ColorResources.getSecondaryHeaderColor(),
            ),
            CardButton(
              onTap: () {
                onChange(1);
              },
              title: "view_card",
              color: ColorResources.getRedColor(),
            ),
            CardButton(
              onTap: () {
                onChange(2);
              },
              title: 'fund_card',
              color: ColorResources.getAcceptBtn(),
            ),
            CardButton(
              title: 'delete_card',
              color: ColorResources.getRedColor(),
            ),
          ],
        ),
      ],
    );
  }
}
