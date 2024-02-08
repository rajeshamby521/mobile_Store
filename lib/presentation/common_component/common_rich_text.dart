import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resource/colors_manager.dart';
import '../../resource/strings_manager.dart';
import '../pages/register_page.dart';

Widget appRichText(
    {titleText, subtitle, onTap, titleTextStyle, subTitleStyle, textAlign}) {
  return RichText(
    textAlign: textAlign ?? TextAlign.start,
    text: TextSpan(
      text: titleText ?? StringManager.dontHaveAnAccount,
      style: titleTextStyle ??
          TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorManager.colorBlack
          ),
      children: <TextSpan>[
        TextSpan(
            text: subtitle ?? StringManager.signUp,
            style: subTitleStyle ??
                TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: ColorManager.primary),
            recognizer: TapGestureRecognizer()
              ..onTap = onTap ??
                  () {
                    Get.to(RegisterPage());
                  } // navigate to desired screen
            )
      ],
    ),
  );
}
