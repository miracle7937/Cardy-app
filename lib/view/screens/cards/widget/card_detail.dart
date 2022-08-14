import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:six_cash/util/images.dart';

import '../../../../util/color_resources.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import '../../../base/custom_snackbar.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "card_details".tr,
            style: rubikMedium.copyWith(
              color: ColorResources.getCardColorText(),
              fontSize: Dimensions.FONT_SIZE_LARGE,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          cardDate(title: "card_pan", value: "4236 7784 3838 8488"),
          cardDate(title: "expiry_date", value: "08/04"),
          cardDate(title: "cvv", value: "324")
        ],
      ),
    );
  }

  cardDate({String title, String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr,
                style: rubikMedium.copyWith(
                  color: ColorResources.getBlackAndWhite(),
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                value,
                style: rubikMedium.copyWith(
                  color: ColorResources.getBlackAndWhite(),
                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                ),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            child: Image.asset(Images.copy_paste),
            onTap: () {
              Clipboard.setData(ClipboardData(text: value ?? "")).whenComplete(
                  () => showCustomSnackBar("copied!", isError: false));
            },
          )
        ],
      ),
    );
  }
}
