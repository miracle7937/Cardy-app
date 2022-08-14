import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/color_resources.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class CardButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color color;
  const CardButton({Key key, this.onTap, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15), blurRadius: 5)
          ],
        ),
        child: Padding(
          child: Text(
            title.tr ?? "",
            style: rubikMedium.copyWith(
              color: ColorResources.COLOR_WHITE,
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        ),
      ),
    );
  }
}
